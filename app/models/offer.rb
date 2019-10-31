# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :offer_user, class_name: 'User'

  enum status: { pending: 0, declined: 1, accepted: 2 }


  validates_presence_of :quantity_requested, :offer_price

  def as_json(options)
    super(options).merge(message: "You have a new #{self.status} offer from #{User.find(self.offer_user_id).username}")
  end

  def decline_other_offers(id, tm_id, user_id, offer_user_id)
    offers = Offer.where(tm_id: tm_id, user_id: user_id, offer_user_id: offer_user_id)
              .where.not(id: id)
    offers.update_all(status: 1)
  end
end

