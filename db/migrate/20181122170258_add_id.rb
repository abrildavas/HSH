class AddId < ActiveRecord::Migration[5.1]
  def change
  	add_column :auctions, :residence_id, :integer
  	add_column :bids, :client_id, :integer
  	add_column :bids, :auction_id, :integer
  	add_column :reservations, :client_id, :integer
  	add_column :weeks, :residence_id, :integer
  end
end
