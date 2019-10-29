class Users::SearchController < ApplicationController
	before_action :authenticate_user!
	
	def index
		render locals: {
			facade: SearchFacade.new(params[:search], params[:sort])
		  }
	end
end
