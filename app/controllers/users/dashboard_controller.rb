# frozen_string_literal: true

class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
