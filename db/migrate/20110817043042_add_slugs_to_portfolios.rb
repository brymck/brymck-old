class AddSlugsToPortfolios < ActiveRecord::Migration
  def change
    add_column :exchanges,  :cached_slug, :string
    add_column :metrics,    :cached_slug, :string
    add_column :portfolios, :cached_slug, :string
    add_column :quotes,     :cached_slug, :string

    # Prevent URL conflicts
    add_index :exchanges,  :cached_slug, unique: true
    add_index :metrics,    :cached_slug, unique: true
    add_index :portfolios, :cached_slug, unique: true
    add_index :quotes,     :cached_slug, unique: true
  end
end
