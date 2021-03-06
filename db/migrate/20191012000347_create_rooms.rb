# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :tm_id

      t.timestamps
    end
    add_index :rooms, :tm_id, unique: true
  end
end
