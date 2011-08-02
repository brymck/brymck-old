class MakeImportanceDefaultToZeroInCode < ActiveRecord::Migration
  def self.up
    change_column :code, :importance, :integer, :default => 0, :null => false
  end

  def self.down
    change_column :code, :importance, :integer, :default => :null, :null => true
  end
end
