class MenusController < ApplicationController
  def index
    @user =current_user
    @menus = Menu.order(:name)
    @order = current_user.orders.creating_order
    render "index"
  end
  def new
    ensure_owner_logged_in
  end
  def create
    ensure_owner_logged_in
    Menu.create(name: params[:name])
    flash[:error] = "Menu created successfully"
    redirect_to new_menu_path
  end
  def show

  end
  def update
    ensure_owner_logged_in
    id = params[:id]
    active_menu = params[:active_menu]
    menu = Menu.find(id)
    menu.active_menu =active_menu
    menu.save!
    redirect_to new_menu_path
  end
  def destroy
    ensure_owner_logged_in
    id =params[:id]
    menu = Menu.find(id)
    menu.destroy
    flash[:error] = "Menu is deleted"
    redirect_to new_menu_path
  end

end
