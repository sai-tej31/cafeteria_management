class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  def self.creating_order
    where("status= ?","started").first
  end
  def self.confirmed
    where("status= ?","confirmed").first
  end
  def self.delivered?
     status= "delivered"
  end
  def total
    amount = 0
    order_items.each { |item|
      amount = amount + item.menu_item_price
    }
    amount
  end
  def all_items
    order_items.order(:menu_item_name).map { |item| item.menu_item_name }
  end
  def order_item(item)
    order_items.where(menu_item_name: item).first
  end

end
