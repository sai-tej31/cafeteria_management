class AddActiveToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :active, :boolean

  end
end
