# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# destroy_all
Article.destroy_all
User.destroy_all
City.destroy_all


# Cities create
10.times do |i|
    City.create(
        name:Faker::Address.city,
        zip_code:Faker::Address.zip_code
    )
    puts "*"*(i+1)
    puts "#{i} city(ies) created"
end


# Users create
10.times do |i|
    name = Faker::Name.name
    User.create(
        name:name,
        email:"#{name}@love.fr",
        age:rand(20..40),
        city_id:City.all.sample.id
    )
    puts "*"*(i+1)
    puts "#{i} user(s) created"
end


# Articles create
20.times do |i|
    Article.create(
        title:Faker::Book.title,
        body:Faker::Lorem.paragraphs(number: 2),
        user_id:User.all.sample.id
    )
    puts "*"*(i+1)
    puts "#{i} article(s) created"
end