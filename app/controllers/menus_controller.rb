class MenusController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render "index"
    #render plain: Menu.order(:id). map{ |menu| menu.to_pleasant_string}.join("\n")
  end
end
