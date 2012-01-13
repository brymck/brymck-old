class Language < ActiveRecord::Base
  extend FriendlyId
  default_scope order("name")
  has_and_belongs_to_many :code
  friendly_id :name, use: :slugged
  translates :url
  prevent_no_slug
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

