class AgregarFechaAReserva < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservations, :fechaInicio, :date
  	add_column :reservations, :fechaFin, :date
   end

end
