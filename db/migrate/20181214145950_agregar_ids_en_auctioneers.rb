class AgregarIdsEnAuctioneers < ActiveRecord::Migration[5.1]
  def change
  	add_column :auctioneers_lists, :client_id, :integer
  	add_column :auctioneers_lists, :week_id, :integer
  end
end
