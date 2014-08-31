User.delete_all
Tweet.delete_all
Following.delete_all

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    password: Faker::Commerce.color,
    email: Faker::Internet.email,
    about: Faker::Lorem.sentence,
    location: Faker::Address.city)
end

20.times do
  Tweet.create(
    content: Faker::Lorem.sentence,
    user_id: rand(10)+1,
    retweet: false
  )
end


Following.create(following_id: 2, follower_id: 1)
Following.create(following_id: 3, follower_id: 1)
Following.create(following_id: 4, follower_id: 1)

