class MenuItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render "index"
  end
  def create
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
end
