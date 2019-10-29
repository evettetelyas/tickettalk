# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy,
                           inverse_of: :room
  has_many :users, through: :room_messages
end
