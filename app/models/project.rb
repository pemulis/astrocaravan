# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image_url   :string(255)
#  location    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true,
                          length: { minimum: 10 }
end
