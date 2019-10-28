require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'instance methods' do
    it '#average_rating returns the average rating for all that users reviews' do
      user = create(:user)
      user.reviews << create(:review, user: user, rating: 1)
      user.reviews << create(:review, user: user, rating: 3)
      user.reviews << create(:review, user: user, rating: 5)

      expect(user.average_rating).to eq(3)
    end
  end
end
