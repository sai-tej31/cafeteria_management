class OnlineUsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render "index"
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      flash[:error] = "Regestered successfully! sign in to continue"
      redirect_to root_path
    else
      flash["error"] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end


end
