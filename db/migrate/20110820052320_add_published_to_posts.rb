class AddPublishedToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :published, :boolean, default: false, null: false

    # Make all current posts published by default
    Post.all.each do |post|
      post.update_attribute :published, true
    end
  end

  def down
    remove_column :posts, :published
  end
end
