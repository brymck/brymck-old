class Tag < ActiveRecord::Base
  has_and_belongs_to_many :code,  uniq: true
  has_and_belongs_to_many :posts, uniq: true
  has_friendly_id :english_name, use_slug: true
  translates :name

  def english_name
    current_locale = I18n.locale
    I18n.locale = :en
    en_name = name
    I18n.locale = current_locale
    en_name
  end
end

# == Schema Information
#
# Table name: tags
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  cached_slug :string(255)
#

