# frozen_string_literal: true

class UpcomingOnSalesJob < ApplicationJob
  queue_as :default

  def find_events(interests)
    interests.map do |interest|
      SearchFacade.new(interest, nil).create_events
    end.flatten
  end

  # This is the real perform function, do not delete!!!!
  def perform(interests)
    next_onsale = []
    find_events(interests).each do |event|
      if event.on_sale && event.on_sale < 24.hours.from_now &&
         event.on_sale > 24.hours.ago
        next_onsale << event
      end
    end
    next_onsale.each do |event|
      SmsNotificationJob.perform_later(event)
    end
  end

  #use this perform for demo purposes, sends a fake event
  # def perform(interests)
  #   event = Event.create!(name: interests[0], tm_id: '1234',
  #                         purchase_url: 'https://www1.ticketmaster.com/billy-joel-in-concert/event/3B00554F068A8833',
  #                         image: 'https://secure.img1-fg.wfcdn.com/im/53299221/compr-r85/4307/43074449/hanging-pug-puppy-statue.jpg',
  #                         on_sale: '12-01-2019', date: '01-01-2300', raw_date: '01-01-2300', price_min: 10.00, price_max: 100.00,
  #                         currency: 'USD', limit: 'There is a 4 ticket limit for this event', venue: 'Pug Theatre')
  #   SmsNotificationJob.perform_later(event)
  # end
end
