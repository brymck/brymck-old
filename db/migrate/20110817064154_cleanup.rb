class Cleanup < ActiveRecord::Migration
  def up
    Source.create_translation_table! name: :string
    remove_index :sources, name: "index_exchanges_on_cached_slug"
    add_index    :sources, :cached_slug, unique: true
  end

  def down
    Source.drop_translation_table!
  end
end
