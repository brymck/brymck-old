class Comment < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :post
  validates :name, :presence => true
  validates :content, :presence => true
  validates :post_id, :presence => true
  translateable :name, :content
end



# == Schema Information
#
# Table name: comments
#
#  id         :integer         primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  post_id    :integer
#  created_at :timestamp
#  updated_at :timestamp
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#

