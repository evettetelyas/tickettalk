# frozen_string_literal: true

class DashboardFacade
  def find_username(id)
    User.find(id).username
  end

  def seller_paypal(user_id)
    user = User.find(user_id)
    "https://www.paypal.me/#{user.paypal_me}"
  end
end
