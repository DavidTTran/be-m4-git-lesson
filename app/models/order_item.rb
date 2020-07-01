class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  before_save :get_price

  def get_price
    item = Item.find(item_id)
    self.price = item.price
  end

  def self.item_quantity(order_id, item_id)
    where("order_id = ? AND item_id = ?", order_id, item_id).count
  end
end
