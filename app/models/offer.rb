class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :offer_user, class_name: 'User'

  enum status: { pending: 0, declined: 1, accepted: 2 }
end
