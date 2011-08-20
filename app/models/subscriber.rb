class Subscriber < ActiveRecord::Base
  attr_accessible :name, :email
  validates_presence_of :name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  class << self
    def address_list
      Subscriber.all.keep_if(&:wants_email?).map(&:header).join(", ")
    end

    def env
      send_to_all = nil

      Subscriber.all.each do |subscriber|
        if subscriber.test?
          return "unknown" if subscriber.inactive?
        else
          if send_to_all.nil?
            send_to_all = subscriber.active?
          else
            return "unknown" if subscriber.active? != send_to_all
          end
        end
      end

      case send_to_all
      when nil then "unknown"
      when true then "production"
      when false then "test"
      end
    end

    def env=(new_env)
      case new_env.to_s
      when "production"
        send_to_all = true
      when "test"
        send_to_all = false
      else
        return nil
      end

      Subscriber.all.each do |subscriber|
        subscriber.update_attribute :active, subscriber.test? || send_to_all
      end
    end
  end

  def header
    "#{name} <#{email}>"
  end

  def wants_email?
    approved? && active? && subscribed?
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

  def unapproved?
    !approved?
  end

  def inactive?
    !active?
  end

  def subscribed?
    !unsubscribed?
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

