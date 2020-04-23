class RemoveIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :id, :bigint
  end
end
