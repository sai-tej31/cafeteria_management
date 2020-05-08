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
    render "users/new"
  end


  def create
    if params[:role]
      role = params[:role]
    else
      role = "customer"
    end
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: role

    )
    current_uri = request.env['PATH_INFO']
    user_check = User.find_by(email: params[:email])
    if user_check
      flash[:error] = "Email already exists"
      if current_uri == "/users/new"
        redirect_to "/users/new"
      else
        redirect_to "/menus/options"
      end
    else
      if user.save
        if user.role == clerk
          flash[:error] = "Regestered successfully"
          redirect_to "/menus/options"
        else
          flash[:error] = "Regestered successfully"
          redirect_to root_path
        end
      else
        flash["error"] = user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
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
