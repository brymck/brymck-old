class Code < ActiveRecord::Base
  extend FriendlyId
  default_scope order: 'code.importance DESC, code.created_at DESC'
  has_and_belongs_to_many :tags, uniq: true
  has_and_belongs_to_many :languages
  validates :title, presence: true
  translateable :title, :description
  slug_as_param
end





# == Schema Information
#
# Table name: code
#
#  id          :integer         primary key
#  title       :string(255)
#  description :text
#  download    :string(255)
#  created_at  :timestamp
#  updated_at  :timestamp
#  source      :string(255)
#  importance  :integer         default(0), not null
#  cached_slug :string(255)
#

