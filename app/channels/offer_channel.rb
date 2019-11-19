# frozen_string_literal: true

class OfferChannel < ApplicationCable::Channel
  def subscribed
    user = User.find params[:user]
    stream_for user
  end
end
