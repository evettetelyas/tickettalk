# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    return unless current_user

    UpcomingOnSalesJob.perform_later(current_user
                                      .interests
                                      .pluck(:keyword)
                                      .uniq)
  end

  def about
  end

  def contact
  end 
end
