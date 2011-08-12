class AddCachedSlugToTags < ActiveRecord::Migration
  def change
    add_column :tags, :cached_slug, :string
    add_index :tags, :cached_slug, :unique => true
  end
end
