class Category < ApplicationRecord
  has_many :items
  validates :name, inclusion: ["Men", "Women", "Accessories"]
end
