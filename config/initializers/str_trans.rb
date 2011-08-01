module StringTranslator
  LANG_REGEX = /^[a-z]{2}\.\s/

  def exclude_other_languages(text, language = I18n.locale)
    parsed = ""
    text.each_line do |line|
      while line =~ /==(.*?)==/
        text = $& # placeholder because we're doing more regex
        first_iteration = true
        translation = ""
        $1.split("|").each do |t|
          if t.strip! =~ /([a-z]{2})\:(.*)/
            if $1.to_sym == I18n.locale
              translation = $2.strip
              break
            end
          else
            if ( first_iteration && I18n.locale == I18n.default_locale) ||
               (!first_iteration && I18n.locale != I18n.default_locale)
              translation = t
              break
            end
          end
          first_iteration = false
        end
        line.gsub! text, translation
      end
      if line =~ LANG_REGEX
        parsed << line[4..-1] if line[0..1].to_sym == I18n.locale
      else
        parsed << line
      end
    end
    parsed
  end
end
