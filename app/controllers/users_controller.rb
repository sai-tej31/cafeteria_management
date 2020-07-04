class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    ensure_owner_logged_in
    @order = current_user.orders.creating_order
  end

  def new
    render "users/new"
  end


  def create
    current_uri = URI(request.referer).path
    if current_uri == "/clerks"
    ensure_owner_logged_in
      role = "clerk"
    else
      role = "customer"
    end
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: role

    )
    user_check = User.find_by(email: params[:email])
    if user_check
      flash[:error] = "email already registered"
      redirect_to current_uri
    else
      if user.save
        flash[:error] = "Regestered successfully"
        if current_uri == "/clerks"
          redirect_to current_uri
        else
          redirect_to root_path
        end
      else
        flash["error"] = user.errors.full_messages.join(", ")
        redirect_to current_uri
      end
    end
  end
  def show
    id = params[:id]
    @user = User.find(id)
    @current_user = User.find(session[:current_user_id])
    render "user_orders"
  end
  def clerks
    ensure_owner_logged_in
    render "clerks"
  end
  def customers
    ensure_owner_logged_in
    render "customers"
  end
end
