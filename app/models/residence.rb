class Residence < ApplicationRecord
	validates :nombre, :direccion, uniqueness: { message:"El nombre y la direccion de cada propiedad deben ser unicos para cada uno. Esta propiedad ya existe, ingrese una nueva."}
	#has_many :auctions, dependent: :destroy
	#has_many :reservations
	#has_and_belongs_to_many :weeks



end
