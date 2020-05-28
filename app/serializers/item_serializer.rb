class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :size, :description, :price, :image_url
  has_many :order_items
  belongs_to :category
  belongs_to :seller

end
