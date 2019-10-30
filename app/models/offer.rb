class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :offer_user, class_name: 'User'

  enum status: { pending: 0, declined: 1, accepted: 2 }

  def as_json(options)
    # super(options).merge(message: "You have a new #{self.status} offer")
    # super(options).merge(message: "You have a new #{self.status} offer")
    super(options)
  end
end