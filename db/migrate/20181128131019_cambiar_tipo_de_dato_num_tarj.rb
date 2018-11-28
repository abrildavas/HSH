class CambiarTipoDeDatoNumTarj < ActiveRecord::Migration[5.1]
  def change
  	  	change_column(:clients, :numTarj, :bigint)
  end
end
