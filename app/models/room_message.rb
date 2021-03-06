# frozen_string_literal: true

class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :user

  def as_json(options)
    super(options).merge(username_url: "/users/#{user.username}",
                         username: user.username,
                         timestamp: updated_at.getlocal.strftime('%l:%M:%S %p'),
                         css_type: render_css_type)
  end

  def render_css_type
    "#{user.message_color}-message-content"
  end
end
