class Users::InterestsController < ApplicationController
	def create
		if current_user.interest_previously_added?(keyword)
			flash[:error] = "#{keyword} was already added to your interests"
		elsif keyword.empty?
			flash[:error] = "Interest can't be blank"
		else
			current_user.interests.create(keyword: keyword)
			flash[:success] = "#{keyword} has been added to your interests!"
		end
		redirect_to profile_path
	end

	protected

	def keyword
		params.require(:interest).permit(:keyword)[:keyword]
		.split
		.map(&:capitalize)
		.join(' ')
	end

  end