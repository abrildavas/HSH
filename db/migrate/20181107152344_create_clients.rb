class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apellido
      t.integer :dni
      t.date :fechaNac
      t.string :mail
      t.string :password
      t.date :fechaReg
      t.integer :creditos

      t.timestamps
    end
  end
end
