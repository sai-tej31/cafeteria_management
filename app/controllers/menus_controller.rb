class MenusController < ApplicationController
  def index
    render "index"
  end
  def new
    render "new"
  end
  def create
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

end
