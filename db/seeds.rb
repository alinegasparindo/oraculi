# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Experience.destroy_all
Skill.destroy_all

require 'faker'
require "open-uri"

# puts 'Starting the seed'
skills = Skill.create([{ name: 'Ruby' }, { name: 'JavaScript' }, { name: 'HTML & CSS' }, { name: 'UI/UX' }, { name: 'Product Management'}, { name: 'PHP'}, { name: 'Angular'}])

image = 'https://static-showpoblog.executiveponies.com/uploads/sites/1/2018/03/the-office-revival-nbc-steve-carell-replaced.png'

aline = User.new({
    email: "aline.gasparindo@gmail.com",
    password: '123456',
    name: "Aline",
    description: Faker::TvShows::MichaelScott.quote
  })

aline.photo.attach(io: URI.open(image), filename: "Aline.png", content_type: 'image/png')
aline.save!
selected_skills = []
rand(1..5).times do
  skill = (skills - selected_skills).sample
  selected_skills.push(skill)
  Experience.create(
  user: aline,
  skill: skill,
  years_of_experience: rand(1..7)
  )
end


admin = User.new({
  email: "admin@admin.com",
  password: 'admin123',
  name: "admin",
  description: Faker::TvShows::MichaelScott.quote
})

admin.photo.attach(io: URI.open(image), filename: "admin.png", content_type: 'image/png')
admin.save!

selected_skills = []
rand(1..5).times do
  skill = (skills - selected_skills).sample
  selected_skills.push(skill)
  Experience.create(
  user: admin,
  skill: skill,
  years_of_experience: rand(1..7)
  )
end

5.times do
  name = Faker::Name.unique.name

  user = User.new({
    email: Faker::Internet.email,
    password: 'guest1',
    name: name,
    description: Faker::TvShows::MichaelScott.quote
  })

  selected_skills = []
  rand(1..5).times do
    skill = (skills - selected_skills).sample
    selected_skills.push(skill)
    Experience.create(
    user: user,
    skill: skill,
    years_of_experience: rand(1..7)
    )
  end
  # # [1..5].sample.times do
  #   user.experiences << Experience.create(
  #     skill: skills.sample,
  #     years_of_experience: [1..7].sample
  #   )
  # # end

  user.photo.attach(io: URI.open(image), filename: "#{name}.png", content_type: 'image/png')
  user.save!
end
