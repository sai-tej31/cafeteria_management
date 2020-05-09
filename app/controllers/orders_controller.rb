class OrdersController < ApplicationController
  def index
    render "index"
  end
  def create
    @order_update = current_user.orders.creating_order
    if @order_update.order_items.empty?
      flash[:error] ="Add items to create an order"
      redirect_to "/order_items"
    else
      @order_update.update!(
        date: Date.today,
        status: "confirmed",
      )
      if @order_update.save!
        flash[:error] ="Your order reached us,soon it will be delivered"
        redirect_to menus_path
      end
    end
  end
  def pending_orders
    render "pending_orders"
  end
  def show
    id = params[:id]
    @specific_order = Order.find(id)
    render "all_orders"
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.status = "delivered"
    order.save!
    flash[:error] =" Order delivered"
    render "pending_orders"
  end

  def destroy
    id = params[:id]
    item = Order.find(id)
    item.destroy
    redirect_to orders_path
  end
end
