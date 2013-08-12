class RemovePostIdFromComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :post_id
    end
  end
end
