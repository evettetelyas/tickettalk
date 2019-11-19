require 'rails_helper'

describe 'User dashboard' do
  before :each do
    @df = DashboardFacade.new
    @user = create(:user, id: 1, username: 'tylor', paypal_me: 'tylor')
    @offer_user = create(:user, id: 2, username: 'bob')
  end

  it '#seller_paypal can return a users paypal me full url' do
    expect(@df.seller_paypal(@user.id)).to eq("https://www.paypal.me/tylor")
  end

  it '#find_user returns a user object' do
    result_1 = @df.find_user(1, 2, 'receive')
    expect(result_1).to eq('bob')

    result_2 = @df.find_user(1, 2, 'sent')
    expect(result_2).to eq('tylor')
  end
end
