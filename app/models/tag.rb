class Tag < ActiveRecord::Base
  translates :name
  has_and_belongs_to_many :code,  uniq: true
  has_and_belongs_to_many :posts, uniq: true
  has_friendly_id :english_name, use_slug: true, allow_nil: true
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
#  id          :integer         not null, primary key
#  name        :string(255)
#  cached_slug :string(255)
#

