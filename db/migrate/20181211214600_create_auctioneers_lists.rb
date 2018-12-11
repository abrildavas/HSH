class CreateAuctioneersLists < ActiveRecord::Migration[5.1]
  def change
    create_table :auctioneers_lists do |t|
      t.integer :auction_id

      t.timestamps
    end
  end
end
