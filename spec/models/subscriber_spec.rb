require 'spec_helper'

describe Subscriber do
  pending "add some examples to (or delete) #{__FILE__}"
end



# == Schema Information
#
# Table name: subscribers
#
#  id           :integer         primary key
#  name         :string(255)     not null
#  email        :string(255)     not null
#  approved     :boolean         default(FALSE), not null
#  active       :boolean         default(TRUE), not null
#  unsubscribed :boolean         default(FALSE), not null
#  created_at   :timestamp
#  updated_at   :timestamp
#  test         :boolean         default(FALSE), not null
#

