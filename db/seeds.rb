# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 1. Create a user


# 2. Create dinners

puts "Cleaning database..."
User.destroy_all
Dinner.destroy_all

puts "Creating user + dinners..."
dummy_user = User.create(email: "simon.frohnauer@gmail.com", password: "secret")

pizza_event = { title: "Pizza Party", category: "italian", date: Date.today, user: dummy_user }
pasta_event = { title: "Carbonara Event", category: "italian", date: Date.today + 10, user: dummy_user }
steak_event = { title: "T-Bone", category: "american", date: Date.today + 100, user: dummy_user }

[pizza_event, pasta_event, steak_event].each do |attr|
  dinner = Dinner.create!(attr)
  puts "Created #{dinner.title}"
end

puts "Seeding finished"
