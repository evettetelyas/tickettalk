class UpcomingOnSalesJob < ApplicationJob
  queue_as :default

  def perform(interests)
    events = interests.map do |interest|
      SearchFacade.new(interest, nil).create_events
    end.flatten
    next_onsale = []
    events.each do |event|
      if event.on_sale && event.on_sale < 24.hours.from_now && event.on_sale > 24.hours.ago
        next_onsale << event
      end
    end
    next_onsale.each do |event|
      SmsNotificationJob.perform_later(event)
    end
  end
end