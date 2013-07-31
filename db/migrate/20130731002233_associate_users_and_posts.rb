class AssociateUsersAndPosts < ActiveRecord::Migration
  def change
    create_table :users_posts do |t|
      t.belongs_to :user
      t.belongs_to :post
    end
  end
end
