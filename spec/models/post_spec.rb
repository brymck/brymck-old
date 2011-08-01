require 'spec_helper'

describe Post do
  before(:each) do
    @post = Factory(:post)
  end

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  personal   :boolean         default(FALSE)
#

