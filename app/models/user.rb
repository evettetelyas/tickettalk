# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates :username, uniqueness: true, presence: true

  validates_presence_of :first_name, :last_name

  has_many :reviews
  has_many :interests
  has_many :room_messages
  has_many :rooms, through: :room_messages

  has_many :events, through: :rooms

  has_many :offers

  def average_rating
    reviews.average(:rating)
  end

  def has_interests?
    interests.count > 0
  end

  def interest_previously_added?(keyword)
    interests.pluck(:keyword).include?(keyword)
  end
end
