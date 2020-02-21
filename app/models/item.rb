class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller
  #validates :name, :size, :description, :price, :image_url, presence: true
end
