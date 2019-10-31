# frozen_string_literal: true

class Users::SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    render locals: {
      facade: SearchFacade.new(params[:search], params[:sort])
    }
  rescue StandardError
    flash[:error] = 'No search results. Try another event!'
    redirect_to root_path
  end
end
