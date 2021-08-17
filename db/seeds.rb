# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
p "Destroying database"
Pet.destroy_all
User.destroy_all
p "Creating users"
User.create!(email: 'bernard.bruck@gmail.com', password: 'XXXXXX')
User.create!(email: 'michael.rosenfeld@gmail.com', password: 'XXXXXX')
User.create!(email: 'syedanayab2014@hotmail.com', password: 'XXXXXX')
User.create!(email: 'sascha.baridara@gmail.com', password: 'XXXXXX')
p "Creating pets"
User.all.each do |user|
  9.times do
  Pet.create!(
    name: Faker::GreekPhilosophers.name,
    species: Faker::Creature::Animal.name,
    description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    price:  Faker::Commerce.price.to_f,
    user: user
  )
  end
end
p "#{Pet.count} pets were created"
