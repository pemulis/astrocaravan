class User < ActiveRecord::Base
  validates :name, presence: true
  validates :skills, presence: true
  validates :description, presence: true

  has_secure_password
end
