module PreventNoSlug
  module Reslugger
    def self.included(base)
      base.class_eval do
        after_save :fix_nil_slugs
      end
    end

    private

    def fix_nil_slugs
      unless slug?
        translation = translations.find_by_locale("en")
        unless translation.nil?
          fixer_slug = create_slug! name: send(friendly_id_config.method).to_slug.normalize.to_s
          update_attribute :cached_slug, fixer_slug.name
        end
      end
    end
  end

  def prevent_no_slug
    include Reslugger
  end
end

module ActiveRecord
  class Base
    extend PreventNoSlug
  end
end
