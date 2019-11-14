# frozen_string_literal: true

class DashboardFacade
  def find_user(user_id, offer_user_id, type)
    return User.find(offer_user_id).username if type == 'receive'
    return User.find(user_id).username if type == 'sent'
  end

  def seller_paypal(user_id)
    user = User.find(user_id)
    "https://www.paypal.me/#{user.paypal_me}"
  end

  def event(tm_id)
    Event.find_by(tm_id: tm_id)
  end

  def received_offers(current_user, kind)
    current_user.offers.where(status: kind).where(user_id: current_user.id)
  end

  def sent_offers(current_user, kind)
    current_user.offers.where(status: kind).where(offer_user_id: current_user.id)
  end

  def old_received_offers(current_user)
    current_user.offers.where(user_id: current_user.id).where("status != 0")
  end

  def old_sent_offers(current_user)
    current_user.offers.where(offer_user_id: current_user.id).where("status != 0")
  end
end
