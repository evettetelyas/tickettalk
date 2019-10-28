class Users::SearchController < ApplicationController
	before_action :authenticate_user!
	
	def index
		render locals: {
			facade: SearchFacade.new(params[:search])
		  }
	end
end
