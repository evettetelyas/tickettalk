# frozen_string_literal: true

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

    it '#interests? returns true if a user has interests' do
      user = create(:user)

      expect(user.interests?).to eq(false)

      create(:interest, user: user)

      expect(user.interests?).to eq(true)
    end

    it '#interest_previously_added? returns true if interest has already been added' do
      user = create(:user)
      interest = create(:interest, user: user)

      expect(user.interest_previously_added?(interest.keyword)).to eq(true)
    end

    it '#offers returns all offers associated with user' do
      user = create(:user)

      expect(user.offers).to eq([])

      offer= create(:offer, user: user)

      expect(user.offers).to eq([offer])
    end

    it '#offer_with returns true if a user have an offer with argument user' do
      user = create(:user)
      other_user = create(:user)

      expect(user.offer_with?(other_user.id)).to be(false)

      create(:offer, user: user, offer_user: other_user)

      expect(user.offer_with?(other_user.id)).to be(false)
    end
  end
end
