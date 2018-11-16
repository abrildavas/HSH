class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :direccion
      t.string :localidad
      t.string :provincia
      t.string :pais

      t.timestamps
    end
  end
end
