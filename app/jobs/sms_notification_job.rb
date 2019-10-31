# frozen_string_literal: true

class SmsNotificationJob < ApplicationJob
  queue_as :default

  def perform(event)
    TwilioSmsService.new(event).new_intrest_event
  end
end
