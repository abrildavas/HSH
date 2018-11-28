class Week < ApplicationRecord
	belongs_to :residence
	has_many :auctions
end
