class Code < ActiveRecord::Base
  include StringTranslator
  default_scope :order => 'code.importance DESC, code.created_at DESC'
  has_and_belongs_to_many :languages
  has_friendly_id :english_title, :use_slug => true
  validates :title, :presence => true

  def english_title
    exclude_other_languages title, :en
  end

  def local_title
    exclude_other_languages title
  end

  def local_description
    exclude_other_languages description
  end
end


# == Schema Information
#
# Table name: code
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  source      :string(255)
#

