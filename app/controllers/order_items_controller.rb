class OrderItemsController < ApplicationController
  def index
    render "index"
  end
  def create
    id = params[:id]
    item = MenuItem.find(params[:id])
      new_order_item=OrderItem.new(
        menu_item_id: item.id,
        menu_item_name: item.name,
        menu_item_price: item.price,
        quantity: 1,
      )
      if new_order_item.save
        flash[:error] ="#{item.name} added to cart"
        redirect_to menus_path
      else
        flash[:error] = new_order_item.errors.full_messages.join(", ")
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
