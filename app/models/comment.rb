# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :commentable, polymorphic: true
end
