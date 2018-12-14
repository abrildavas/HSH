class AgregarResidenceIdAAuctioneer < ActiveRecord::Migration[5.1]
  def change
  	add_column :auctioneers_lists, :residence_id, :integer
  end
end
