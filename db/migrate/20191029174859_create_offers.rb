class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.float :offer_price
      t.integer :quantity_requested
      t.string :notes
      t.bigint :offer_user_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
