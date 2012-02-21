module SlugAsParam
  def slug_as_param
    define_method :to_param do
      slug
    end
  end
end

module ActiveRecord
  class Base
    extend SlugAsParam
  end
end

