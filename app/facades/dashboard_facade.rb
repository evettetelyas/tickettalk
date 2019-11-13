# frozen_string_literal: true

class DashboardFacade
  def find_username(id)
    User.find(id).username
  end

  def seller_paypal(user_id)
    user = User.find(user_id)
    "https://www.paypal.me/#{user.paypal_me}"
  end

  def event(tm_id)
    Event.find_by(tm_id: tm_id)
  end

  def offers(current_user, kind)
    current_user.offers.where(status: kind)
  end

  def recieved_offers(current_user, kind)
    current_user.offers.where(status: kind).where(user_id: current_user.id)
  end

  def sent_offers(current_user, kind)
    current_user.offers.where(status: kind).where(offer_user_id: current_user.id)
  end
end
