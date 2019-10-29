# frozen_string_literal: true

class Users::EventsController < ApplicationController
  def index
    render locals: {
      facade: MyEventsFacade.new(current_user)
    }
  end
end
