class Post < ActiveRecord::Base
  translates :title, :content
  has_and_belongs_to_many :tags, uniq: true
  has_many :comments
  validates_presence_of :title, :content
  has_friendly_id :english_title, use_slug: true, allow_nil: true
  prevent_no_slug

  class << self
    def blog
      self.where(personal: false)
    end

    def journal
      self.where(personal: true)
    end
  end

  def english_title
    translation = translations.find_by_locale("en")
    if translation.nil?
      title || attributes[:title]
    else
      translation.title
    end
  end
end




# == Schema Information
#
# Table name: posts
#
#  id          :integer         primary key
#  title       :string(255)
#  content     :text
#  created_at  :timestamp
#  updated_at  :timestamp
#  personal    :boolean         default(FALSE)
#  cached_slug :string(255)
#

