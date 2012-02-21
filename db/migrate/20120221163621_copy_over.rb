class CopyOver < ActiveRecord::Migration
  def up
    matches = ActiveRecord::Base.connection.execute("SELECT b.id, a.locale, a.title, a.content FROM post_translations a, posts b WHERE a.post_id = b.id")
    matches.each do |match|
      @post = Post.find_by_id(match["id"])
      if match["locale"] == "en"
        @post.update_attribute :title_en, match["title"]
        @post.update_attribute :content_en, match["content"]
      else
        @post.update_attribute :title_ja, match["title"]
        @post.update_attribute :content_ja, match["content"]
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
