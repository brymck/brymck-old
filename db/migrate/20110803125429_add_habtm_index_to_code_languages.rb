class AddHabtmIndexToCodeLanguages < ActiveRecord::Migration
  def self.up
    add_index :code_languages, [:code_id, :language_id], :unique => true
  end

  def self.down
    remove_index :code_languages, :column => [:code_id, :language_id]
  end
end
