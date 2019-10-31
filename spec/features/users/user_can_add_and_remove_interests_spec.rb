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

		click_on "Remove"
		expect(page).to have_content("Phish has been deleted")

		visit profile_path
		expect(page).to_not have_content("Phish")
	end

	it 'A flash is displayed if interests are incorrectly added' do
		interest = create(:interest, keyword: "Fakestring", user: @user)

		visit profile_path

		fill_in "Add an Interest", with: interest.keyword
		click_on "Add to My Interests"
		expect(page).to have_content("#{interest.keyword} was already added to your interests")

		visit profile_path

		fill_in "Add an Interest", with: ""
		click_on "Add to My Interests"
		expect(page).to have_content("Interest can't be blank")
	end
end
