class RenameCodesToCode < ActiveRecord::Migration
  def self.up
    rename_table :codes, :code
  end

  def self.down
    rename_table :code, :codes
  end
end
