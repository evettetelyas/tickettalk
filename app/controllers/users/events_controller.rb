class Users::EventsController < ApplicationController
	def index
	  render locals: {
	   facade: MyEventsFacade.new(current_user)
	  }
	end
  end