class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :role, :string
    add_column :users, :email, :string
    add_column :users, :role, :string
    add_column :users, :password_digest, :string
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime

  end
end
