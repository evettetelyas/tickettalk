require 'rails_helper'

RSpec.describe "user interests" do
	before :each do
		@user = create(:user, password: 'password')
	
		visit login_path
	
		fill_in 'Email', with: @user.email
		fill_in 'Password', with: @user.password
		click_on 'Log in'
	
		visit profile_path
	end

	it "adds and removes interests" do
		fill_in "Add an Interest", with: "phish"
		click_on "Add to My Interests"

		expect(page).to have_content("Phish")

		click_on "Remove Interest"
		expect(page).to have_content("Phish has been deleted")

		visit profile_path
		expect(page).to_not have_content("Phish")
	end
end