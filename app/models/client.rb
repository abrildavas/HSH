class Client < ApplicationRecord
	has_many :bids
	has_many :reservations
end
