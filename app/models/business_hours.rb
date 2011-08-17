class BusinessHours < ActiveRecord::Base
  belongs_to :location

  AFTER_MIDNIGHT = /^(2[4-9])(.*?)$/

  def open?(time = Time.now)
    today = time.in_time_zone(time_zone)

    # Test first to see whether it's open today
    if open_on_day?(today.wday)
      if time.between?(create_hours(opening, today), create_hours(closing, today))
        return true
      end
    end

    # Only bother checking yesterday if we have times past midnight
    if closing =~ AFTER_MIDNIGHT
      one_day_ago = today - 1.day
      if open_on_day?(one_day_ago.wday)
        if time.between?(create_hours(opening, one_day_ago), create_hours(closing, one_day_ago))
          return true
        end
      end
    end

    # Return false otherwise
    false
  end

  def closed?(time = Time.now)
    !open?(time)
  end

  def to_a
    hours = [create_hours(opening), create_hours(closing)].map do |h|
      h.hour + h.min.to_f / 60
    end

    7.times.map do |wday|
      hours if open_on_day?(wday)
    end
  end

  private

  def open_on_day?(wday)
    case wday
      when 0 then sunday?
      when 1 then monday?
      when 2 then tuesday?
      when 3 then wednesday?
      when 4 then thursday?
      when 5 then friday?
      when 6 then saturday?
    end
  end

  def create_hours(str, base_date = Time.now)
    if str =~ AFTER_MIDNIGHT
      ref_date = Time.parse("#{$1.to_i - 24}#{$2}")
      base_date += 1.day
    else
      ref_date = Time.parse(str)
    end
    base_date.change(hour: ref_date.hour, min: ref_date.min)
  end
end



# == Schema Information
#
# Table name: business_hours
#
#  id          :integer         primary key
#  opening     :string(255)
#  closing     :string(255)
#  time_zone   :string(255)
#  location_id :integer
#  sunday      :boolean         default(FALSE)
#  monday      :boolean         default(FALSE)
#  tuesday     :boolean         default(FALSE)
#  wednesday   :boolean         default(FALSE)
#  thursday    :boolean         default(FALSE)
#  friday      :boolean         default(FALSE)
#  saturday    :boolean         default(FALSE)
#

