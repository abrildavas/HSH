class Week < ApplicationRecord
	has_and_belongs_to_many :residences
end
