require 'rails_helper'

describe 'User login' do
  before :each do
    @user = create(:user, username: 'tylor')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
  end

  it 'Users can sign in' do
    expect(page).to have_content('Signed in successfully.')
  end

  it 'Users can sign out' do
    click_on 'Logout'

    expect(page).to have_content('Signed out successfully.')
  end
end
