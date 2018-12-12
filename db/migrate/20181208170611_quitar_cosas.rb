class QuitarCosas < ActiveRecord::Migration[5.1]
  def change
  	remove_column :residences, :estado
  end
end
