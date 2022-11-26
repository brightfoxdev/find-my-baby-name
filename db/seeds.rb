# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Group.destroy_all
Label.destroy_all
Name.destroy_all
Origin.destroy_all

5.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        nickname: Faker::Internet.username,
        password: Faker::Internet.password,
        image: Faker::Avatar.image
    )
end

# User.create(name: 'name', email: 'email@email.com', nickname: 'nick', password: 'Password123', image: '')

8.times do
    Group.create(
        user_id: Faker::Number.between(from: 1, to: 10),
        name: Faker::Kpop.boy_bands)
end


20.times do
    Label.create(name: Faker::Dessert.variety)
end

gender_array = ['male', 'female', 'neutral']

50.times do
    Name.create(name: Faker::Name.first_name, meaning: Faker::Coffee.notes, gender: gender_array.sample)
end

10.times do
    Origin.create(origin: Faker::Coffee.origin)
end

puts "Users: #{User.all.length}"
puts "Groups: #{Group.all.length}"
puts "Labels: #{Label.all.length}"
puts "Names: #{Name.all.length}"
puts "Origins: #{Origin.all.length}"