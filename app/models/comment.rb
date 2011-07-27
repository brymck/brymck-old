class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, :presence => true
  validates :content, :presence => true
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
#

