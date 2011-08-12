class Code < ActiveRecord::Base
  default_scope :order => 'code.importance DESC, code.created_at DESC'
  has_and_belongs_to_many :tags, :uniq => true
  has_and_belongs_to_many :languages
  has_friendly_id :english_title, :use_slug => true
  translates :title, :description
  validates :title, :presence => true

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

