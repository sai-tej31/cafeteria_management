class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
#    if customer
#      render "customer"
#    elsif admin
#      render "admin"
#    elsif clerk
#      render "clerk"
#    end
  end

  def new
    render "users/customer_new"
  end


  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: params[:role],
    )
    if user.save
      flash[:error] = "Regestered successfully! sign in to continue"
      redirect_to "/users/new"
    else
      flash["error"] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
  def show
#    if customer
    render "customer"
#    elsif admin
#      render "admin"
#    elsif clerk
#      render "clerk"
#    end
  end
end
