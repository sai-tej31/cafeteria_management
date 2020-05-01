class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render "index"
  end
  def create
    new_order = Order.new(
      date: Date.today,
      user_id: current_user.id,
      status: "Not completed",
    )
    if new_order.save
      flash[:error] ="Your Order is placed"
      redirect_to "/order_items"
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
      redirect_to "/order_items"
    end
    def show
      id = params[:id]
      render "orders/#{@orders.id}"
    end
  end
end
