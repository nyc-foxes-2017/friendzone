# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#make users

100.times do
  User.create(
  name: Faker::Name.name,
  email: Faker::Internet.free_email,
  password: Faker::Internet.password,
  avatar_url: Faker::Avatar.image
  )
  puts "#{User.count} Friends created..."

end

#make friendships
until Friendship.count == 200 do


  friend_a = rand(100)+1
  friend_b = rand(100)+1

  next if friend_a == friend_b

  a_friends = Friendship.where("requester = ? or requestee = ?", friend_a, friend_a)
  b_friends = Friendship.where("requester = ? or requestee = ?", friend_b, friend_b)

  next if a_friends.any? do |friend|
    b_friends.any? do |b_friend|
      friend == b_friend
    end
  end

  Friendship.create(requester: friend_a, requestee: friend_b, pending: [false, false, false, true].sample)
  puts "#{Friendship.count} friendships created..."

end

#make posts

500.times do |i|
  Post.create(
  user_id: rand(100)+1,
  content: Faker::Hacker.say_something_smart
  )
  puts "#{Post.count} Posts created..."

end
#make likes

until Like.count == 1000 do
  friend = rand(100)+1
  post = rand(500)+1

  next if Like.where("user_id = ? and post_id = ?", friend, post).count != 0

  Like.create(user_id: friend, post_id: post)
  puts "#{Like.count} likes created..."

end
