class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item
  def total
    total = 0
    order_items.each {|item|
      total = total + item.menu_item_price}
    total
  end
end
