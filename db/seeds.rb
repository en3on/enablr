# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Start of seeding'

# Create users

params = {
  email: Faker::Internet.email,
  password: 'password',
  password_confirmation: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  fundraiser: true,
  country: Faker::Address.country,
  city: Faker::Address.city
}

user = User.new(params)

puts "Creating user #{user.first_name}"

user.save


# Create Projects

params = {
  name: 'software project',
  description: 'first software project',
  hardware: 'false',
  target_amount: '100_000',
  target_date: '20 Apr 2020',
  category: 'App',
  country: 'Australia',
  city: 'Melbourne'
}

project = user.projects.new(params)

puts "Creating project #{project.name}"

project.save

params = {
  name: 'tech',
  description: 'second software project',
  hardware: 'true',
  target_amount: '50_000',
  target_date: '18 Apr 2020',
  category: 'App',
  country: 'Australia',
  city: 'Sydney'
}

project = user.projects.new(params)

puts "Creating project #{project.name}"

project.save

puts 'Seeding complete'
