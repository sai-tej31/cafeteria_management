class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  def self.creating_order
    where("status= ?","started").first
  end
  def self.confirmed
    where("status= ?","confirmed").first
  end
  def self.delivered
    where("status= ?","delivered").first
  end

end
