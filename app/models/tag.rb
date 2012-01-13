class Tag < ActiveRecord::Base
  extend FriendlyId
  translates :name
  has_and_belongs_to_many :code,  uniq: true
  has_and_belongs_to_many :posts, uniq: true
  friendly_id :english_name, use: :slugged
  prevent_no_slug

  def count
    code.count + posts.count
  end

  def english_name
    translation = translations.find_by_locale("en")
    if translation.nil?
      name || attributes[:name]
    else
      translation.name
    end
  end
end


# == Schema Information
#
# Table name: tags
#
#  id          :integer         primary key
#  name        :string(255)
#  cached_slug :string(255)
#

