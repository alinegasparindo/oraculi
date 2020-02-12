# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


skills = Skill.create([{ name: 'Ruby' }, { name: 'JavaScript' }, { name: 'HTML & CSS' }, { name: 'UI/UX' }, { name: 'Product Management'}, { name: 'PHP'}, { name: 'Angular'}])


puts 'Creating some users...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    name: Faker::Name.first_name,
  )
  user.save!
end
