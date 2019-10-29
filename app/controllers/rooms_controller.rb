class RoomsController < ApplicationController
	# Loads:
  	# @rooms = all rooms
  	# @room = current room when applicable
	before_action :load_entities
	before_action :authenticate_user!
  
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
		binding.pry
		@room_message = RoomMessage.new room: @room
		@room_messages = @room.room_messages.includes(:user)
		@event = Event.find_by(tm_id: @room.tm_id)
		render locals: {
			facade: RoomShowFacade.new
		}
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
