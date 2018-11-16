class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.float :precioBase
      t.float :precioActual

      t.timestamps
    end
  end
end
