class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    create_table :code_languages, :id => false do |t|
      t.integer :code_id
      t.integer :language_id
    end
  end

  def self.down
    drop_table :languages
    drop_table :code_languages
  end
end
