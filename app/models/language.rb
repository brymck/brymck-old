class Language < ActiveRecord::Base
  default_scope order("name")
  has_and_belongs_to_many :code
  has_friendly_id :name, use_slug: true, allow_nil: true
  translates :url
end



# == Schema Information
#
# Table name: languages
#
#  id          :integer         primary key
#  name        :string(255)
#  url         :string(255)
#  created_at  :timestamp
#  updated_at  :timestamp
#  cached_slug :string(255)
#

