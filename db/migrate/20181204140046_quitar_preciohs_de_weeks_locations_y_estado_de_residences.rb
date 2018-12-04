class QuitarPreciohsDeWeeksYLocation < ActiveRecord::Migration[5.1]
  def change
  	remove_column :weeks, :preciohs
  	drop_table :locations
  	remove_column :residences, :estado
  end
end

