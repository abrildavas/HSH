class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :nombre
      t.string :descripcion
       t.float :precio
      t.string :estado
      t.timestamps
    end
  end
end
