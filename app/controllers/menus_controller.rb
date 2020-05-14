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
    if menu.active_menu == false
      flag = 1
    else
      flag = 0
    end
    Menu.all.each do |menu|
      if menu.active_menu==true
        flag+=1
      end
    end
    if flag != 1
      flash[:error] = "Select Only One Menu as Active Menu"
      redirect_to new_menu_path
    else
      if menu.active_menu == true or flag == 1
        redirect_to menus_path
      end
    end
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
