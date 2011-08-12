class AddTranslationToTags < ActiveRecord::Migration
  def self.up
    Tag.create_translation_table!({
      name: :string
    }, {
      migrate_data: true
    })
  end

  def self.down
    Tag.drop_translation_table! migrate_data: true
  end
end
