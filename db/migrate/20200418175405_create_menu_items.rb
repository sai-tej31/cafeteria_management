class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :menu_id
      t.string :name
      t.string :description
      t.string :price
    end
  end
end
