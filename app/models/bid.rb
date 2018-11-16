class Bid < ApplicationRecord
	belongs_to :client
	belongs_to :auction	 
end
