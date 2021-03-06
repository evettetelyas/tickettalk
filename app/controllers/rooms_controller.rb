# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :load_entities
  before_action :authenticate_user!

  def create
    @room = Room.find_or_create_by permitted_parameters
    @room.event = Event.find_by(tm_id: params[:tm_id])
    @room.save
    redirect_to "/rooms/#{@room.id}"
  end

  def show
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
