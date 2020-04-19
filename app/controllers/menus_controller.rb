class MenusController < ApplicationController
  def index
    render plain: Menu.order(:id). map{ |menu| menu.to_pleasant_string}.join("\n")
  end
end
