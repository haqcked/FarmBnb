# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database for category"
Category.destroy_all

puts "creating categories"

animal_categories = ['Dog', 'Cat', 'Bird', 'Fish', 'Horse', 'Duck', 'Rabbit', 'Chicken', 'Goat', 'horse']

animal_categories.each do |category|
  Category.create!(name: category)
end
puts "created 10 categories"


puts "cleaning database for animals"
# Animal.destroy_all

puts "creating animal 1"
Animal.create!(name: "Jazz", description: "a gray cat", price: 15, user_id: 1, category_id: Category.all.sample.id)
puts "creating animal 2"
Animal.create!(name: "Bruno", description: "a colorful parot", price: 15, user_id: 1, category_id: Category.all.sample.id)
puts "creating animal 3"
Animal.create!(name: "Miley", description: "a brown chihuahua", price: 25, user_id: 1, category_id: Category.all.sample.id)
puts "creating animal 4"
Animal.create!(name: "Voldemort", description: "a green hamster", price: 35, user_id: 1, category_id: Category.all.sample.id)
puts "creating animal 5"
Animal.create!(name: "Harry", description: "an orange rabbit", price: 10, user_id: 1, category_id: Category.all.sample.id)
puts "creating animal 6"
Animal.create!(name: "Jefferson", description: "a handsome goat", price: 20, user_id: 1, category_id: Category.all.sample.id)
puts "creating animal 7"
Animal.create!(name: "Sarah", description: "a white horse", price: 40, user_id: 1, category_id: Category.all.sample.id)
puts "done creating 7 animals"

puts "========================================="
