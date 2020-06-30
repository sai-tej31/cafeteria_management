class OrderItemsController < ApplicationController
  def index
    @order = current_user.orders.creating_order
    @current_order = current_user.orders.confirmed
    render "index"
  end

  def create
    id = params[:id]
    new_order = current_user.orders.where(status: "started").first ? current_user.orders.where(status: "started").first : Order.create(
      user_id: current_user.id,
      status: "started",

    )
    item = MenuItem.find(id)
    new_order_item = OrderItem.create(
      order_id: new_order.id,
      menu_item_id: item.id,
      menu_item_name: item.name,
      menu_item_price: item.price,
      quantity: 1,
    )
    flash[:error] ="#{item.name} added to cart"
    if params[:count]
      redirect_to order_items_path
    else
      redirect_to menus_path
    end
  end

  def destroy
    id = params[:id]
    item = OrderItem.find(id)
    item.destroy
    redirect_to order_items_path
  end
end
