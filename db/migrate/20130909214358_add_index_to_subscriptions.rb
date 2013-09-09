class AddIndexToSubscriptions < ActiveRecord::Migration
  def change
    add_index :subscriptions, [:subscribable_id, :subscribable_type]
  end
end
