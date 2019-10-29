class AddStatusToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :status, :integer, default: 0
  end
end
