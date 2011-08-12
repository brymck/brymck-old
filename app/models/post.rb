class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags, :uniq => true
  has_many :comments
  has_friendly_id :english_title, :use_slug => true
  translates :title, :content
  validates_presence_of :title, :content

  class << self
    def blog
      self.where(:personal => false)
    end

    def journal
      self.where(:personal => true)
    end
  end

  def english_title
    current_locale = I18n.locale
    I18n.locale = :en
    en_title = title
    I18n.locale = current_locale
    en_title
  end
end



# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  personal    :boolean         default(FALSE)
#  cached_slug :string(255)
#

