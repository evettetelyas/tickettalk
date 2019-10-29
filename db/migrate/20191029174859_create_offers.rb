class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.integer :offer_price
      t.integer :quantity_requested
      t.string :notes
      t.bigint :offer_user_id
      t.bigint :user_id
    end
  end
end
