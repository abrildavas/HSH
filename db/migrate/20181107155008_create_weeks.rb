class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.date :inicio
      t.date :fin
      t.string :estado
      t.timestamps
    end
  end
end
