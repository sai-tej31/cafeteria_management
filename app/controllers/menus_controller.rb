class MenusController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render "index"
  end
  def new
    render "new"
  end
  def show
  end
  def update
    id = params[:id]
    active_menu = params[:active_menu]
    menu = Menu.find(id)
    menu.active_menu =active_menu
    menu.save!
    if menu.active_menu == false
      flag = 1
    else
      flag = 0
      initial = true
    end
    Menu.all.each do |menu|
      if menu.active_menu==true
        flag+=1
      end
    end
    if flag != 1
      flash[:error] = "Select Only One Active Menu"
      redirect_to new_menu_path
    else
      if menu.active_menu == true or flag == 1
        redirect_to menus_path
      else
        redirect_to new_menu_path
      end
    end
  end

end
