class UsersController < ApplicationController

  def show
    user = User.find_by(username: params[:username])
    render locals: {
      facade: UserShowFacade.new(user)
    }
  end
end
