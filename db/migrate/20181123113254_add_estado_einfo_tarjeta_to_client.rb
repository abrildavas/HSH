class AddEstadoEinfoTarjetaToClient < ActiveRecord::Migration[5.1]
  def change
  	add_column :clients, :estado, :string
  	add_column :clients, :marcaTarj, :string
  	add_column :clients, :numTarj, :integer
  	add_column :clients, :fechaVencTarj, :date

  end
end
