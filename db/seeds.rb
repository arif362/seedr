# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do
  Campaign.create!(name: "#{Faker::Name.unique.name}", amount: "#{Faker::Number.between(2, 15)}", sector: "#{Faker::Name.unique.name}", country: "#{Faker::Name.unique.name}" )
end