class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller
  #has_many :order_items
  validates :name, :size, :description, :price, :image_url,  presence: true
end
