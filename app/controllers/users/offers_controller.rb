# frozen_string_literal: true

class Users::OffersController < ApplicationController
  def new
    @tm_id = params[:tm_id]
    @max_quantity = if params[:max_quantity]
                      params[:max_quantity].gsub(/[^0-9]/, '')
                    else
                      4
                    end
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.create(offer_params)
    if @offer.save
      flash[:success] = "You have submitted an offer to #{@user.username}"
      OfferChannel.broadcast_to @user, @offer
      redirect_to user_show_path(@user.username)
    else
      flash[:error] = @offer.errors.full_messages.to_sentence
      render :new
    end
  end

  def paypal_check(offer)
    if current_user.paypal_me
      offer.update_attributes(status: :accepted)
      flash[:success] =
        "#{offer.offer_user.username}'s offer has been accepted"
    else
      flash[:error] =
        'You must link your paypal account
         in your profile before accepting offers'
    end
  end

  def update
    offer = Offer.find(params[:offer_id])
    if params[:accept] == 'true'
      paypal_check(offer)
      offer.decline_other_offers(offer.id, offer.tm_id, offer.user_id, offer.offer_user_id)
    else
      offer.update_attributes(status: :declined)
      flash[:success] = "#{offer.offer_user.username}'s offer has been declined"
    end
    offer.save
    redirect_to '/profile'
  end

  private

  def offer_params
    create_params = params.require(:offer).permit(:quantity_requested,
                                                  :offer_price,
                                                  :notes)
    create_params[:user_id] = params[:user_id].to_i
    create_params[:offer_user_id] = params[:offer_user_id].to_i
    create_params[:tm_id] = params[:tm_id]
    create_params
  end
end