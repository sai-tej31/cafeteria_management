class MenuItemsController < ApplicationController
  before_action :ensure_owner_logged_in
  def index
    render "index"
  end
  def create
    menu = Menu.where(name: params[:menu_name]).exists? ? Menu.where(name: params[:menu_name]).first : Menu.new(name: params[:menu_name])
    menu.save
    id = params[:id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menu_item = MenuItem.new(
      name: name,
      description: description,
      price: price,
      menu_id: menu.id
    )
    if new_menu_item.save && menu.save
      redirect_to menu_items_path
    else
      flash[:error] = new_menu_item.errors.full_messages.join(", ")
      redirect_to menu_items_path
    end
  end
  def update
    id = params[:id]
    item = MenuItem.find(id)
    menu = Menu.all.where(active_menu: true).first
    if item.menu_id == menu.id
      item.menu_id = Menu.find_by(name: "default").id
      item.save
      flash[:error]="#{item.name} removed from menu successfully"
      redirect_to menu_items_path
    else
      item.menu_id = menu.id
      item.save
      flash[:error]="#{item.name} added to menu successfully"
      redirect_to menu_items_path
    end
  end

  def destroy
    id = params[:id]
    item = MenuItem.find(id)
    item.destroy
    redirect_to menu_items_path
  end
end
