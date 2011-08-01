class Comment < ActiveRecord::Base
  include StringTranslator
  acts_as_nested_set
  belongs_to :post
  validates :name, :presence => true
  validates :content, :presence => true

  def local_name
    exclude_other_languages name
  end

  def local_content
    exclude_other_languages content
  end
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

