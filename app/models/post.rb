# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Post < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :description, presence: true,
                          length: { minimum: 10 }
end
