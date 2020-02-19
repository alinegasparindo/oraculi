# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '***********************'
puts 'Clearing the current db'
User.destroy_all
puts '-Deleted users'
Experience.destroy_all
puts '-Deleted experiences'
Skill.destroy_all
puts '-Deleted skills'
puts 'Clearing db completed'
puts '***********************'


require 'faker'
require "open-uri"
puts ''

puts '***********************'
puts 'Currently seeding'
puts '***********************'
puts ''

skills = Skill.create([{ name: 'Ruby' }, { name: 'JavaScript' }, { name: 'HTML & CSS' }, { name: 'UI/UX' }, { name: 'PHP'}, { name: 'Angular'}])

defaul_image = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
boss_image = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Steve_Carell_2010.jpg/170px-Steve_Carell_2010.png'


images = [
  'https://static-showpoblog.executiveponies.com/uploads/sites/1/2018/03/the-office-revival-nbc-steve-carell-replaced.png',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2615&q=80',
  'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
  'https://images.unsplash.com/photo-1505503693641-1926193e8d57?ixlib=rb-1.2.1&auto=format&fit=crop&w=2667&q=80',
  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
  'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2600&q=80',
  'https://images.unsplash.com/photo-1484863137850-59afcfe05386?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2551&q=80',
  'https://images.unsplash.com/photo-1464746133101-a2c3f88e0dd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2654&q=80',
  'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2190&q=80',
  'https://images.unsplash.com/photo-1457131760772-7017c6180f05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2672&q=80',
  'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2551&q=80',
  'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1496840220025-4cbde0b9df65?ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1492446845049-9c50cc313f00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2660&q=80',
  'https://images.unsplash.com/photo-1509955252650-8f558c2b8735?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2733&q=80',
  'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=804&q=80',
  'https://images.unsplash.com/photo-1450297350677-623de575f31c?ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
  'https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1484588168347-9d835bb09939?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1498387727476-b30055b2ef21?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2582&q=80',
  'https://images.unsplash.com/photo-1515486191131-efd6be9f711f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1492447166138-50c3889fccb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1485178575877-1a13bf489dfe?ixlib=rb-1.2.1&auto=format&fit=crop&w=2582&q=80',
  'https://images.unsplash.com/photo-1484972759836-b93f9ef2b293?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
  'https://images.unsplash.com/photo-1500336624523-d727130c3328?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80',
  'https://images.unsplash.com/photo-1441716844725-09cedc13a4e7?ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80',
]

def generateExperiences(user, skills)
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

end

admin = User.create({
  email: "admin@admin.com",
  password: 'admin123',
  name: "Admin Johnson",
  description: Faker::TvShows::MichaelScott.quote
})
admin.photo.attach(io: URI.open(defaul_image), filename: "admin.png", content_type: 'image/png')
generateExperiences(admin, skills)

aline = User.create({
    email: "aline.gasparindo@gmail.com",
    password: '123456',
    name: "Aline",
    description: Faker::TvShows::MichaelScott.quote
  })
aline.photo.attach(io: URI.open(boss_image), filename: "Aline.png")
generateExperiences(aline, skills)

image_index = 0
images.length().times do
  name = Faker::Name.unique.name

  user = User.create({
    email: Faker::Internet.email,
    password: 'guest1',
    name: name,
    description: Faker::TvShows::MichaelScott.quote
  })

  generateExperiences(user, skills)
  image = images[image_index]
  user.photo.attach(io: URI.open(image), filename: "#{name}.png")
  image_index += 1
end

puts 'Seeding completed'
