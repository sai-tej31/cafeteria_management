class AddDeliveredToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :delivered, :boolean
  end
end
