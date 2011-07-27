class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_friendly_id :title, :use_slug => true

  class << self
    def blog
      self.where(:personal => false)
    end

    def journal
      self.where(:personal => true)
    end
  end

  def author
    user.name
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
#  personal   :boolean         default(FALSE)
#

