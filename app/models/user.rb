# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates :username, format: { with: /\A[a-zA-Z0-9 ]+\z/ },
                       uniqueness: true,
                       presence: true

  validates_presence_of :first_name, :last_name, :message_color

  has_many :interests, dependent: :destroy
  has_many :room_messages, dependent: :destroy
  has_many :rooms, through: :room_messages

  has_many :events, through: :rooms

  has_many :reviews, dependent: :destroy

  has_many :offers, dependent: :destroy

  def average_rating
    reviews.average(:rating)
  end

  def interests?
    interests.count.positive?
  end

  def interest_previously_added?(keyword)
    interests.pluck(:keyword).include?(keyword)
  end

  def offers
    Offer.where(user_id: id)
         .or(Offer.where(offer_user_id: id))
  end

  def offer_with?(user_id)
    offers.where(user_id: user_id).count.positive?
  end
end
