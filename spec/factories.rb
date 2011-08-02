# coding: utf-8

Factory.define :post do |post|
  post.title 'Title'
  post.content 'Content'
end

Factory.define :multilingual_post, :parent => :post do |post|
  post.title "== Title | ja: タイトル =="
  post.content "en. Content\n\nja. コンテンツ"
end

Factory.define :comment do |comment|
  comment.name "Name"
  comment.email "email@example.com"
  comment.content "Content"
end

Factory.define :multilingual_comment, :parent => :comment do |comment|
  comment.name "== Name | ja: 名前 =="
  comment.email "email@example.com"
  comment.content "en. Content\n\nja. コンテンツ"
end
