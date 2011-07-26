class Code < ActiveRecord::Base
  validates :title, :presence => true
end

# == Schema Information
#
# Table name: codes
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  url         :string(255)
#  screenshot  :binary(2097152)
#  created_at  :datetime
#  updated_at  :datetime
#

