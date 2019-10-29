# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    UpcomingOnSalesJob.perform_later(Interest.all.pluck(:keyword).uniq)
  end
end
