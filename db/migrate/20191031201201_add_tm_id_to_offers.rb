class AddTmIdToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :tm_id, :string
  end
end
