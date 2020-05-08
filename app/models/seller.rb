class Seller < ApplicationRecord
  has_secure_password
  validates :name, presence: true 
  has_many :items
end
