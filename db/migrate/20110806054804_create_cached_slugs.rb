class CreateCachedSlugs < ActiveRecord::Migration
  def self.up
    add_column :code,      :cached_slug, :string
    add_column :languages, :cached_slug, :string
    add_column :posts,     :cached_slug, :string

    # Prevent URL conflicts
    add_index :code,       :cached_slug, :unique => true
    add_index :languages,  :cached_slug, :unique => true
    add_index :posts,      :cached_slug, :unique => true
  end

  def self.down
    remove_column :code,      :cached_slug
    remove_column :languages, :cached_slug
    remove_column :posts,     :cached_slug
  end
end
