class AgregarPrecioHotsaleAWeek < ActiveRecord::Migration[5.1]
  def change
  	add_column :weeks, :preciohs, :integer
  end
end
