class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def add_to_cart(item)
    current_item = item.order_items.build(order_id: self.id)
    if current_item.save
      current_item
    else
      current_item.errors.full_messages
    end
  end
end
