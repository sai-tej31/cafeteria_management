class OrderItemsController < ApplicationController
  def index
    @order = current_user.orders.creating_order
    render "index"
  end

  def create
    id = params[:id]
    new_order = current_user.orders.where(status: "started").first ? current_user.orders.where(status: "started").first : Order.create!(
      user_id: current_user.id,
      status: "started"
    )
    item = MenuItem.find(id)
    new_order_item = OrderItem.create(
      order_id: new_order.id,
      menu_item_id: item.id,
      menu_item_name: item.name,
      menu_item_price: item.price,
      quantity: 1,
    )
#      if new_order_item.save
    flash[:error] ="#{item.name} added to cart"
    redirect_to menus_path
#      else
#        flash[:error] = new_order_item.errors.full_messages.join(", ")
 #       redirect_to menus_path
  #    end
  end
  def destroy
    id = params[:id]
    item = OrderItem.find(id)
    item.destroy
    redirect_to order_items_path
  end
end
