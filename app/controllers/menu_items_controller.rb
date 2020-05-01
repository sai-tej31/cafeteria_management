class MenuItemsController < ApplicationController
  def index
    id = params[:id]
    @menu = Menu.find(id)
    render "index"
  end
  def create
    id = params[:id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menu_item = MenuItem.new(
      name: name,
      description: description,
      price: price,
    )
    if new_menu_item.save
      redirect_to menu_items_path
    else
      flash[:error] = new_menu_item.errors.full_messages.join(", ")
      redirect_to menus_items_path
    end
  end
  def update
    id = params[:id]
    item = MenuItem.find(id)
    menu = @menus.of_menu
    item.menu_id = menu.id
    item.save
    redirect_to menu_items_path
  end

  def destroy
    id = params[:id]
    item = MenuItem.find(id)
    item.destroy
    redirect_to menu_items_path
  end
end
