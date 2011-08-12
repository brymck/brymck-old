class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags, uniq: true
  has_many :comments
  has_friendly_id :english_title, use_slug: true, allow_nil: true
  translates :title, :content
  validates_presence_of :title, :content
  after_save :prevent_no_slug

  class << self
    def blog
      self.where(personal: false)
    end

    def journal
      self.where(personal: true)
    end
  end

  def english_title
    current_locale = I18n.locale
    I18n.locale = :en
    en_title = title
    I18n.locale = current_locale
    en_title
  end

  private

  # Definitely need to DRY this up
  def prevent_no_slug
    begin
      unless slug?
        create_slug! name: english_title.to_slug.normalize.to_s
        update_attribute :cached_slug, slug
      end
    rescue
      puts "Failed to prevent no slug."
    end
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

