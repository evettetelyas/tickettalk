# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
      UpcomingOnSalesJob.perform_later(current_user.interests.pluck(:keyword).uniq) if current_user
  end

  def about
  end

  def contact
  end 
end
