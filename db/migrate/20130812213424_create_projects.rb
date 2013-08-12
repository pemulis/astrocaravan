class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :location

      t.timestamps
    end

    create_table :projects_users do |t|
      t.belongs_to :project
      t.belongs_to :user
    end
  end
end
