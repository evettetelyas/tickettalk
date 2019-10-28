class UserShowFacade

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def new_review
    Review.new
  end

  def username
    user.username
  end

  def average_rating
    user.average_rating
  end

  def reviews
    user.reviews
  end
end
