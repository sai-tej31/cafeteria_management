class AddItemNameToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :quantity, :bigint

  end
end
