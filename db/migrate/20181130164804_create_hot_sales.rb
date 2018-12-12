class CreateHotSales < ActiveRecord::Migration[5.1]
  def change
    create_table :hot_sales do |t|
      t.float :precio
      t.integer :residence_id
      t.integer :week_id

      t.timestamps
    end
  end
end
