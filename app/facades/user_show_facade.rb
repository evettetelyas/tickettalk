# frozen_string_literal: true

class UserShowFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def user_check?(current_user)
    user != current_user
  end

  def events
    user.events.uniq
  end

  def new_review
    Review.new
  end

  def username
    user.username
  end

  def average_rating
    user.average_rating.round(1)
  end

  def reviews
    user.reviews
  end
end
