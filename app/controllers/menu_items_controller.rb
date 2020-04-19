class MenuItemsController < ApplicationController
  def index
    render plain: MenuItem.order(:id). map{ |menu_item| menu_item.to_pleasant_string}.join("\n")
  end
end
