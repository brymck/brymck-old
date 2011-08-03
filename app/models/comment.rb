class Comment < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :post
  translates :name, :content
  validates :name, :presence => true
  validates :content, :presence => true
  validates :post_id, :presence => true
end


# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#

