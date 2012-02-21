class Language < ActiveRecord::Base
  default_scope order("name_en")
  has_and_belongs_to_many :code
  translateable :name, :url
  slug_as_param
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

