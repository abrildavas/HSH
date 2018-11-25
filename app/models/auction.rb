class Auction < ApplicationRecord
	belongs_to :weeks
	has_many :bids, dependent: :destroy
end
