class RenameCachedSlugToSlug < ActiveRecord::Migration
  def change
    %w(code languages locations portfolios posts quotes sources tags).each do |table|
      rename_column table, :cached_slug, :slug
    end
  end
end
