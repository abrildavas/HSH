class AgregarLocationToResidences < ActiveRecord::Migration[5.1]
  def change
  	add_column :residences, :pais, :string
  	add_column :residences, :provincia, :string
  	add_column :residences, :localidad, :string
  	add_column :residences, :direccion, :string
  end
end
