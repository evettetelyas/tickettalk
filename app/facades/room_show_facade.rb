# frozen_string_literal: true

class RoomShowFacade
  def find_username(id)
    User.find(id).username
  end

  def event(tm_id)
    Event.find_by(tm_id: tm_id)
  end
end
