class Week < ApplicationRecord
	belongs_to :residence
	has_many :hot_sales
	has_many :auctions
end
