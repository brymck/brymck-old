class Post < ActiveRecord::Base
  include StringTranslator
  has_many :comments
  has_friendly_id :english_title, :use_slug => true

  class << self
    def blog
      self.where(:personal => false)
    end

    def journal
      self.where(:personal => true)
    end
  end

  def english_title
    exclude_other_languages title, :en
  end

  def local_title
    exclude_other_languages title
  end

  def local_content
    exclude_other_languages content
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

