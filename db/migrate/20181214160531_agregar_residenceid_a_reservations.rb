class AgregarResidenceidAReservations < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservations, :residence_id, :integer
  end
end
