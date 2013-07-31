class ChangeUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :skills, :text
    remove_column :users, :description, :text
    remove_column :users, :name, :string
    add_column :users, :username, :string
  end
end
