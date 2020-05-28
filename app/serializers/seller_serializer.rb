class SellerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url
  has_many :items
end
