# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |index|
  post_data = {
    title: FFaker::Lorem.sentence,
    body: FFaker::Lorem.paragraph
  }
  post = Post.create(post_data).tap do |post|
    20.times do |comment_index|
      comment_data = { body: FFaker::Lorem.paragraph }
      post.comments.create!(comment_data)
      puts "Comment for post #{index} - #{comment_index}: #{comment_data.to_json}"
    end
  end
  puts "Post #{index}: #{post.to_json}"
end
