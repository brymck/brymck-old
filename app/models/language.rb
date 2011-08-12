class Language < ActiveRecord::Base
  default_scope order("name")
  has_and_belongs_to_many :code
  has_friendly_id :name, use_slug: true
  translates :url
end


# == Schema Information
#
# Table name: languages
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  cached_slug :string(255)
#

