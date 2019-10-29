class SmsNotificationJob < ApplicationJob
  queue_as :default

  def initialize(event)
    @event = event
  end

  def perform
    TwilioSmsService.new(@event).new_intrest_event
  end
end



  # include Sidekiq::Worker
