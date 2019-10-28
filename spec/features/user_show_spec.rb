require 'rails_helper'

describe 'User show page' do
  before :each do
    @user = create(:user)
    @user2 = create(:user, password: 'password')
    @review = create(:review, user: @user, reviewer: @user2, rating: 5)

    visit login_path

    fill_in 'Email', with: @user2.email
    fill_in 'Password', with: @user2.password
    click_on 'Log in'

    visit "/users/#{@user.username}"
  end

  it 'shows info about that user' do

    expect(page).to have_content("#{@user.username}'s Profile")
    expect(page).to have_content('Average Rating: 5')
    expect(page).to have_css('.reviews')

    within(first('.reviews')) do
      expect(page).to have_content(@user2.username)
      expect(page).to have_content(@review.rating)
      expect(page).to have_content(@review.content)
    end
  end

  it 'Users can leave reviews about that user' do
    expect(page).to have_css('.new-review')

    within('.new-review') do
      select 3, from: 'Rating'
      fill_in 'Content', with: 'This guy rocks!'
      click_on 'Create Review'
    end

    within(first('.reviews')) do
      expect(page).to have_content(@user2.username)
      expect(page).to have_content(3)
      expect(page).to have_content('This guy rocks!')
    end

    expect(page).to have_content('Average Rating: 4')
  end

  it 'An error will be displayed if a review cannot be created' do
    within('.new-review') do
      fill_in 'Content', with: ''
      click_on 'Create Review'
    end

    expect(page).to have_content("Content can't be blank")

    visit "/users/#{@user2.username}"

    within('.new-review') do
      select 3, from: 'Rating'
      fill_in 'Content', with: 'This guy rocks!'
      click_on 'Create Review'
    end

    expect(page).to have_content("Sorry, you can only submit reviews about other users")
  end
end
