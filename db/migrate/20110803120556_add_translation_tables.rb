class AddTranslationTables < ActiveRecord::Migration
  def self.up
    Code.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
    Comment.create_translation_table!({
      :name => :string,
      :content => :text
    }, {
      :migrate_data => true
    })
    Language.create_translation_table!({
      :url => :string
    }, {
      :migrate_data => true
    })
    Post.create_translation_table!({
      :title => :string,
      :content => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Code.drop_translation_table!     :migrate_data => true
    Comment.drop_translation_table!  :migrate_data => true
    Language.drop_translation_table! :migrate_data => true
    Post.drop_translation_table!     :migrate_data => true
  end
end
