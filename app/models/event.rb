# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image_url   :string(255)
#  location    :string(255)
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :description, presence: true,
                          length: { minimum: 10 }
end
