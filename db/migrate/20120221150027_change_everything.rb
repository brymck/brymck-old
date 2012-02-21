class ChangeEverything < ActiveRecord::Migration
  def change
    %w(exchanges languages locations metrics portfolios quotes sources tags).each do |table|
      rename_column table, :name, :name_en
      add_column    table, :name_ja, :string
    end

    # Code
    rename_column :code, :title, :title_en
    add_column    :code, :title_ja, :string
    rename_column :code, :description, :description_en
    add_column    :code, :description_ja, :text

    # Comments
    rename_column :comments, :name, :name_en
    add_column    :comments, :name_ja, :string
    rename_column :comments, :content, :content_en
    add_column    :comments, :content_ja, :text

    # Posts
    rename_column :posts, :title, :title_en
    add_column    :posts, :title_ja, :string
    rename_column :posts, :content, :content_en
    add_column    :posts, :content_ja, :text
  end
end
