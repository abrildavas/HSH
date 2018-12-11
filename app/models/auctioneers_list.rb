class AuctioneersList < ApplicationRecord
	has_many :clients 
	belongs_to :auction
end
