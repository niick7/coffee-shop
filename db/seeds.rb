# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create dummy data for coffee, dessert and food
30.times.each do |_i|
  CoffeeItem.create(name: Faker::Coffee.blend_name, amount: rand(10..20), tax_rate: rand(0.01..0.10).round(2))
end
15.times.each do |_i|
  DessertItem.create(name: Faker::Dessert.variety, amount: rand(10..20), tax_rate: rand(0.01..0.10).round(2))
  FoodItem.create(name: Faker::Food.dish, amount: rand(10..20), tax_rate: rand(0.01..0.10).round(2))
end

random_items = Item.order('RAND()').limit(10).to_a
5.times.each do |_i|
  Discount.create(
    first_item_id: random_items.pop.id,
    second_item_id: random_items.shift.id,
    first_item_discount_rate: rand(0.1..1),
    second_item_discount_rate: rand(0.1..1)
  )
end
