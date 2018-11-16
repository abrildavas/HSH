class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :nombre
      t.string :apellido
      t.string :nomUsuario
      t.string :password

      t.timestamps
    end
  end
end
