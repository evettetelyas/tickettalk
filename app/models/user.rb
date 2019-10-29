class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates :username, uniqueness: true, presence: true

  validates_presence_of :first_name, :last_name

  has_many :reviews

  has_many :room_messages
  has_many :rooms, through: :room_messages

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def average_rating
    reviews.average(:rating)
  end
end
