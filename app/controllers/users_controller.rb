# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find_by(username: params[:username])
    render locals: {
      facade: UserShowFacade.new(user)
    }
  end
end
