class ModificarAuctions < ActiveRecord::Migration[5.1]
  def change
  	rename_column :auctions, :residence_id, :week_id
  end
end
