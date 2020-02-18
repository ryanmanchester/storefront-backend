class Item < ApplicationRecord
  belongs_to :category
  validates :name, :size, :description, :price, :image_url, presence: true
end
