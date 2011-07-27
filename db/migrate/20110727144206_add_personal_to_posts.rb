class AddPersonalToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :personal, :boolean, :default => :false
  end

  def self.down
    remove_column :posts, :personal
  end
end
