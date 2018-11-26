class Auction < ApplicationRecord
	belongs_to :week
	has_many :bids, dependent: :destroy
end
