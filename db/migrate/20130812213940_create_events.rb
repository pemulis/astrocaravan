class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :location
      t.datetime :date

      t.timestamps
    end

    create_table :events_users do |t|
      t.belongs_to :event
      t.belongs_to :user
    end
  end
end
