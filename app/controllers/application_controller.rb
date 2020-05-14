class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end
  def ensure_owner_logged_in
    unless current_user.role == "admin"
      redirect_to menus_path
    end
  end

  def ensure_clerk_logged_in
    unless current_user.role == "clerk"
      redirect_to menus_path
    end
  end

  def ensure_owner_or_clerk_logged_in
    unless current_user.role == "clerk" || current_user.role == "admin"
      redirect_to menus_path
    end
  end


  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

  def current_menu
    return @current_menu if @current_menu
    current_menu_id = menu[:id]
    if current_menu_id
      @current_menu = Menu.find(current_menu_id)
    else
      nil
    end
  end



end
