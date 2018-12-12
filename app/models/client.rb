class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :dni, uniqueness: true
   	has_many :bids
	has_many :reservations
	validates :dni, length: { minimum: 0, maximum: 8 }
	
end
