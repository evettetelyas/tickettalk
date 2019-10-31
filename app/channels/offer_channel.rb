# frozen_string_literal: true

class OfferChannel < ApplicationCable::Channel
  def subscribed
    user = User.find params[:user]
    stream_for user
    # offer = Offer.find params[:offer]
    # stream_for offer
    # stream_for current_user
    # offer = Offer.find params[:offer]
    # stream_for offer
  end
end