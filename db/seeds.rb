require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants and reviews..."
5.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.category = Restaurant::CATEGORIES.sample
  restaurant.address = Faker::Address.street_address
  restaurant.save!
  puts "Created restaurant"

  review = Review.new
  review.content = Faker::Restaurant.review
  review.rating = (1..5).to_a.sample
  review.restaurant = restaurant
  review.save!
  puts "Created review"
end

puts "Finished"