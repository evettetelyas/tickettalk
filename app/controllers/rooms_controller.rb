class RoomsController < ApplicationController
	# Loads:
  	# @rooms = all rooms
  	# @room = current room when applicable
	before_action :load_entities
	before_action :authenticate_user!


	def index
	  @rooms = Room.all
	end

	def new
	  @room = Room.new
	end

	def create
	  @room = Room.find_or_create_by permitted_parameters
	  # if @room.save
		# flash[:success] = "#{@room.name} was created successfully"
		# redirect_to rooms_path
	  # else
		# render :new
	  # end
	  redirect_to "/rooms/#{@room.id}"
	end

	def show
		@room_message = RoomMessage.new room: @room
		@room_messages = @room.room_messages.includes(:user)
		render locals: {
			facade: RoomShowFacade.new
		}
	end
  
	def edit
	end

	def update
	  if @room.update_attributes(permitted_parameters)
		flash[:success] = "#{@room.name} was updated successfully"
		redirect_to rooms_path
	  else
		render :new
	  end
	end

	protected

	def load_entities
	  @rooms = Room.all
	  @room = Room.find(params[:id]) if params[:id]
	end

	def permitted_parameters
	  params.permit(:name, :tm_id)
	end
  end
