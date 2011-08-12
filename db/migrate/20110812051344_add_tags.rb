class AddTags < ActiveRecord::Migration
  def up
    # Tags
    create_table :tags do |t|
      t.string :name
      t.string :cached_slug
    end

    # Prevent URL conflicts
    add_index :tags, :name,        :unique => true
    add_index :tags, :cached_slug, :unique => true

    # Post HABTM
    create_table :posts_tags, :id => false do |t|
      t.integer :post_id
      t.integer :tag_id
    end
    add_index :posts_tags, [:post_id, :tag_id], :unique => true

    # Code HABTM
    create_table :code_tags, :id => false do |t|
      t.integer :code_id
      t.integer :tag_id
    end
    add_index :code_tags, [:code_id, :tag_id], :unique => true

    Tag.create_translation_table! name: :string
  end

  def down
    Tag.drop_translation_table!
    drop_table :posts_tags
    drop_table :code_tags
    drop_table :tags
  end
end
