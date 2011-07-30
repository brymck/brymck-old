Factory.define :user do |user|
  user.provider 'twitter'
  user.name 'User'
  user.admin false
end

Factory.define :admin, :parent => :user do |admin|
  admin.name 'Admin'
  admin.admin true
end

Factory.define :post do |post|
  post.title 'Title'
  post.content 'Content'
  post.association :user
end
