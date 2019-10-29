# frozen_string_literal: true

class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :user

  # def as_json(options)
  #   super(options).merge(user_avatar_url: user.gravatar_url)
  # end

  def as_json(options)
    super(options).merge(username_url: "/users/#{user.username}", username: user.username)
  end
end
