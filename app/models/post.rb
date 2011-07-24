class Post < ActiveRecord::Base
  belongs_to :user

  def name
    user.name
  end

  def slug
    title.downcase.gsub /[^a-z0-9]+/, "-"
  end
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

