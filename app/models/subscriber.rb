class Subscriber < ActiveRecord::Base
  attr_accessible :name, :email
  validates_presence_of :name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  def wants_email?
    approved? && active? && !unsubscribed?
  end

  def approve!
    update_attribute :approved, true
  end

  def activate!
    update_attribute :active, true
  end

  def deactivate!
    update_attribute :active, false
  end

  def status
    if unsubscribed?
      :unsubscribed
    else
      if approved?
        if active?
          :active
        else
          :inactive
        end
      else
        :unapproved
      end
    end
  end
end


# == Schema Information
#
# Table name: subscribers
#
#  id           :integer         not null, primary key
#  name         :string(255)     not null
#  email        :string(255)     not null
#  approved     :boolean         default(FALSE), not null
#  active       :boolean         default(TRUE), not null
#  unsubscribed :boolean         default(FALSE), not null
#  created_at   :datetime
#  updated_at   :datetime
#  test         :boolean         default(FALSE), not null
#

