class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :tm_id
      t.string :purchase_url
      t.string :image
      t.string :on_sale
      t.string :date
      t.string :raw_date
      t.float :price_min
      t.float :price_max
      t.string :currency
      t.string :seatmap
      t.string :limit
      t.string :venue
    end
  end
end
