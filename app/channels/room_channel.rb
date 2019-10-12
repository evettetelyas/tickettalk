class RoomChannel < ApplicationCable::Channel
	def subscribed
	  room = Room.find params[:room]
	  stream_for room
  
	  # or
	  # stream_from "room_#{params[:room]}"
	  # stream_from: we manually define the name of the stream and later on, when we want to broadcast to the stream, we have to use: ActionCable.server.broadcast("room_#{a_room_id_here}", data)
	end
  end