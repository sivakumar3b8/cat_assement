class User < ApplicationRecord
	validates :name, presence: true
	validates :age, presence: true
	validates :email, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true
end
