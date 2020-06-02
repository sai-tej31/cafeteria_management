class OrdersController < ApplicationController
  def index
    ensure_owner_or_clerk_logged_in
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
    ensure_owner_or_clerk_logged_in
  end


  def show
    id = params[:id]
    @specific_order = Order.find(id)
    render "order"
  end

  def update
    ensure_owner_or_clerk_logged_in
    current_uri = URI(request.referer).path
    id = params[:id]
    order = Order.find(id)
    if order.status == "confirmed"
      order.status = "delivered"
      order.save!
      flash[:error] =" Order delivered"
    elsif
      order.status = "confirmed"
      order.save!
      flash[:error] = "order not delivered"
    end
    redirect_to current_uri

  end

  def destroy
    id = params[:id]
    item = Order.find(id)
    item.destroy
    redirect_to orders_path
  end
end
