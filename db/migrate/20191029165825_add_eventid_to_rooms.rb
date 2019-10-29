class AddEventidToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :event_id, :integer
  end
end
