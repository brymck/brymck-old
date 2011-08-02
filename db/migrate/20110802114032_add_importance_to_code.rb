class AddImportanceToCode < ActiveRecord::Migration
  def self.up
    add_column :code, :importance, :integer
  end

  def self.down
    remove_column :code, :importance
  end
end
