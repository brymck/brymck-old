class Language < ActiveRecord::Base
  include StringTranslator
  default_scope :order => 'languages.name ASC'
  has_and_belongs_to_many :code
  has_friendly_id :name, :use_slug => true

  def local_url
    exclude_other_languages url
  end
end
