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
user_bethy = User.create(email: "bethy@gmail.com", password: "secret", name: "bethy", address: "Stachus, Munich")
user_simon = User.create(email: "simon@gmail.com", password: "secret", name: "simon", address: "Balan, Munich")
user_ale = User.create(email: "ale@gmail.com", password: "secret", name: "yung g", address: "Harras, Munich")
user_milo = User.create(email: "milo@gmail.com", password: "secret", name: "milo", address: "Odeonsplatz, Munich")

pizza_event = { title: "Pizza Party", category: "italian", date: Date.today, user: user_simon, description: "Yummy Italian evening" }
pasta_event = { title: "Carbonara Event", category: "italian", date: Date.today + 10, user: user_ale, description: "Yummy Pasta evening" }
steak_event = { title: "T-Bone Steak", category: "american", date: Date.today + 100, user: user_milo, description: "Medium rare or well done?" }
salad_event = { title: "Caesar Salad in the Sun", category: "american", date: Date.today + 100, user: user_bethy, description: "We'll celebrate spring!" }

dessert_event = { title: "Pancakes and Gin Tonic", category: "german", date: Date.today, user: user_simon, description: "Please bring your favorite sweet goods" }
fish_event = { title: "Fly like Fish Filet", category: "greek", date: Date.today + 9, user: user_ale, description: "Greek fish event" }
ramen_event = { title: "Ramen Slurp", category: "japanese", date: Date.today + 47, user: user_milo, description: "We'll have veggie and chicken stock options" }
cake_event = { title: "Sachertorte Speisung", category: "austrian", date: Date.today + 100, user: user_bethy, description: "1000kcal per plate" }

[pizza_event, pasta_event, steak_event, salad_event, dessert_event, ramen_event, fish_event, cake_event].each do |attr|
  dinner = Dinner.create!(attr)
  puts "Created #{dinner.title}"
end

puts "Seeding finished"
