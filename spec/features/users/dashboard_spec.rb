require 'rails_helper'

describe 'User dashboard' do
  it '#seller_paypal can return a users paypal me full url' do
    df = DashboardFacade.new
    user = create(:user, paypal_me: 'tylor')

    expect(df.seller_paypal(user.id)).to eq("https://www.paypal.me/tylor")
  end
end
