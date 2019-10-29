# frozen_string_literal: true

class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    user_check?(reviewed_user) ?
      review = reviewed_user.reviews.create(review_params) :
      flash[:error] = 'Sorry, you can only submit reviews about other users'
    if review
      if review.save
        flash[:success] =
          "You have successfully submited your review of #{reviewed_user.username}"
      else
        flash[:error] = review.errors.full_messages.to_sentence
      end
    end
    redirect_to user_show_path(reviewed_user.username)
  end

  def reviewed_user
    User.find_by(username: params[:username])
  end

  def user_check?(user)
    user.username != current_user.username
  end

  private

  def review_params
    review_params = params.require(:review).permit(:rating, :content)
    review_params[:reviewer_id] = current_user.id
    review_params
  end
end
