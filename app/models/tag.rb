class Tag < ActiveRecord::Base
  has_and_belongs_to_many :code,  uniq: true
  has_and_belongs_to_many :posts, uniq: true
  slug_as_param

  def count
    code.count + posts.count
  end

  def name
    name_en
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

