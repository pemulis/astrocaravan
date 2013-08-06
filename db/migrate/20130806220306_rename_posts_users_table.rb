class RenamePostsUsersTable < ActiveRecord::Migration
  def change
    rename_table :users_posts, :posts_users
  end
end
