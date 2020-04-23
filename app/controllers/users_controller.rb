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
  def create
    user = User.new(
      first_name: params[:first_name],
      email: params[:email],
      password: params[:password],
      role: params[:role],
    )
    if user.save
      flash[:error] = "Regestered successfully! sign in to continue"
      redirect_to root_path
    else
      flash["error"] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
  def show
    if User.customer
      render "customer"
      user.destroy(user.id)
    elsif User.admin
      render "admin"
      user.destroy(user.id)
    elsif User.clerk
      render "clerk"
      user.destroy(user.id)
    end
  end
end
