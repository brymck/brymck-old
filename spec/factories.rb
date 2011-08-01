# coding: utf-8

Factory.define :post do |post|
  post.title 'Title'
  post.content 'Content'
end

Factory.define :multilingual_post, :parent => :post do |post|
  post.title "== Title | ja: タイトル =="
  post.content "en. Content\n\nja. コンテンツ"
end
