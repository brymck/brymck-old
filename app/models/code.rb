class Code < ActiveRecord::Base
  default_scope order: 'code.importance DESC, code.created_at DESC'
  translates :title, :description
  has_and_belongs_to_many :tags, uniq: true
  has_and_belongs_to_many :languages
  validates :title, presence: true
  has_friendly_id :english_title, use_slug: true, allow_nil: true
  prevent_no_slug

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
# Table name: code
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  download    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  source      :string(255)
#  importance  :integer         default(0), not null
#  cached_slug :string(255)
#

