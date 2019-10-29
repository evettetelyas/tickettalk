# frozen_string_literal: true

class Users::OffersController < ApplicationController
  def new
    @max_quantity = params[:max_quantity]
  end

  def create
    user = User.find(params[:user])
    offer = Offer.create(offer_params)
    if offer.save
      flash[:succes] = "You have submitted an offer to #{params[:username]}"
      redirect_to user_show_path(user.username)
    else
      flash[:error] = offer.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def offer_params
    create_params = params.require(:offer).permit(:quantity_requested,
                                 :offer_price,
                                 :notes,)
    create_params[:user_id] = params[:user].to_i
    create_params[:offer_user_id] = params[:offer_user].to_i
    create_params
  end
end
