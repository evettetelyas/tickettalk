class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :offer_user, class_name: 'User'
end
