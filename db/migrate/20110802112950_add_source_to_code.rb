class AddSourceToCode < ActiveRecord::Migration
  def self.up
    add_column :code, :source, :string
  end

  def self.down
    remove_column :code, :source
  end
end
