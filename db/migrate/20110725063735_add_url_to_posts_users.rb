class AddUrlToPostsUsers < ActiveRecord::Migration
  def self.up
    add_column :posts, :url, :string
    add_column :users, :url, :string
  end

  def self.down
    remove_column :posts, :url
    remove_column :users, :url
  end
end

