module LocationsHelper
  def business_hours_in_words(location, &block)
    results = []
    location.combined_business_hours.each_with_index do |day, index|
      unless day.nil?
        opening  = time_from_hours(day[0])
        closing  = time_from_hours(day[1])
        day_text = t(:abbr_day_names, scope: :date)[index]
        results << t(:range, scope: [:time, :formats], from: opening, to: closing, day: day_text)
      end
    end
    results.delete nil
    results
  end

  def google_map(location)
    content_tag :iframe, nil,
      width: 425,
      height: 350,
      frameborder: 0,
      scrolling: "no",
      marginheight: 0,
      marginwidth: 0,
      src: "http://maps.google.com/maps?q=#{location.address.to_s}&output=embed"
  end

  private

  def time_from_hours(hours)
    time = Time.now.change(hour: hours.to_i, min: (hours % 1) * 60)
    l(time, format: :tiny)
  end
end
