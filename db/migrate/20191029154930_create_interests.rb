class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.references :user, foreign_key: true
      t.string :keyword

      t.timestamps
    end
  end
end
