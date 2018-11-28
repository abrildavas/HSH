class Plss < ActiveRecord::Migration[5.1]
  def change
  	add_column :clients, :password, :string
  	add_column :administrators, :password, :string
  end
end
