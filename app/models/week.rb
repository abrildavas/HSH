class Week < ApplicationRecord
	belongs_to :residence
	has_many :hot_sale
	has_many :auctions
end
