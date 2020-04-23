class Menu < ActiveRecord::Base

  def self.of_menu(menu)
    all.where(menu_id: menu.id)
  end
end
