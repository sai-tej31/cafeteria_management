class MenuItem < ActiveRecord::Base
  belongs_to :menu
  def self.of_menu
    all.where(active_menu: true)
  end
end
