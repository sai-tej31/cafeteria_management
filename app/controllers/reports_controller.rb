class ReportsController < ApplicationController
  def index
    render "index"
  end
  def update
    if params[:date]
      fromdate = params[:date]
      todate = params[:date]
      @orders = Order.date < todate && Order.date > fromdate
      redirect_to "/reports/order_reports"
    elsif params[:email]
      user = User.email(params[:email])
      if user
        redirect_to("/users##{user.id}")
      else
        redirect_to(users_path, alert: "User not found")
      end
    end
  end
end
