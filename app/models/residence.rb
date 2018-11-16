class Residence < ApplicationRecord
	has_many :auctions, dependent: :destroy
	has_many :reservations
	has_and_belongs_to_many :weeks


end
