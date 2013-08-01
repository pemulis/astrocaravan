# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  username        :string(255)
#

class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :posts
  has_many :comments
end
