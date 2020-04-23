class DropMenuItems < ActiveRecord::Migration[6.0]
  def change
    drop_table :menu_items
  end
end
