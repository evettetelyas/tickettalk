# frozen_string_literal: true

class NotificationChannel < ApplicationCable::Channel
  def subscribed
    binding.pry
    @offers = current_user.offers
    stream_for @offers
  end
end
