module Translateable
  def translateable(*args)
    args.each do |name|
      define_method name do
        send("#{name}_#{I18n.locale}") || send("#{name}_en")
      end
    end
  end
end

module ActiveRecord
  class Base
    extend Translateable
  end
end
