class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :nombre
      t.string :apellido
      t.string :nomUsuario

      t.timestamps
    end
  end
end
