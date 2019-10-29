class TwilioSmsService
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def get_room
    Room.find_by(tm_id: @event.tm_id)
  end

  def new_intrest_event
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: '+17204434012',
      body: "An event for #{@event.name} is about to go on sale at #{@event.venue} - check out the room on TicketTalk at TicketTalk.herokuapp.com/rooms/#{get_room.id}"
    })
  end
end
