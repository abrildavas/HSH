class Auction < ApplicationRecord
	belongs_to :residence
	has_many :bids, dependent: :destroy
end
