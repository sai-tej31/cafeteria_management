class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def self.get_order_item(menu_item_id)
    where("menu_item_id = ?", menu_item_id)
  end

  def self.price(item)
    find_by(menu_item_name: item).menu_item_price
  end
end
