# frozen_string_literal: true

class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :user

  def as_json(options)
    super(options).merge(username_url: "/users/#{user.username}", username: user.username, timestamp: self.updated_at.localtime.strftime("%l:%M:%S %p"))
  end
end
