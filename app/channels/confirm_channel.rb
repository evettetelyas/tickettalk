# frozen_string_literal: true

class ConfirmChannel < ApplicationCable::Channel
  def subscribed
    user = User.find params[:user]
    stream_for user
  end
end