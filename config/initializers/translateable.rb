module Translateable
  def translateable(*args)
    args.each do |name|
      # Set up getter method
      define_method name do
        send "#{name}_#{I18n.locale || "en"}"
      end

      define_method "#{name}=" do |n|
        send "#{name}_#{I18n.locale || "en"}=", n
      end
    end
  end
end

module ActiveRecord
  class Base
    extend Translateable
  end
end
