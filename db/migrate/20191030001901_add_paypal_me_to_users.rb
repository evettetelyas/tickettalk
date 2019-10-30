class AddPaypalMeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :paypal_me, :string
  end
end
