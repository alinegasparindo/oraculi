# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

skills = Skill.create([{ name: 'Ruby' }, { name: 'JavaScript' }, { name: 'HTML & CSS' }, { name: 'UI/UX' }, { name: 'Product Management'}, { name: 'PHP'}, { name: 'Angular'}])
file = URI.open('https://static-showpoblog.executiveponies.com/uploads/sites/1/2018/03/the-office-revival-nbc-steve-carell-replaced.png')


20.times do
  user = User.create({
    email: Faker::Internet.email,
    password: 'guest1',
    name: Faker::Name.name,
    description: Faker::TvShows::MichaelScott.quote,
    photo:
  })

  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  user.experiences.create({
      skill: skills.sample,
      years_of_experience: [1..10].sample
    })
end


