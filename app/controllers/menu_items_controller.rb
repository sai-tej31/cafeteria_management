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
    image = params[:image]
    new_menu_item = MenuItem.new(
      name: name,
      description: description,
      price: price,
      menu_id: menu.id,
      image: image
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
    if item.active == false
      item.active = true
      item.save!
      flash[:error]="#{item.name} Made active successfully"
      redirect_to menu_items_path
    else
      item.active = false
      item.save!
      flash[:error]="#{item.name} Made In-active successfully"
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
