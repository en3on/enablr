# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Start of seeding'

puts 'creating projects'
10.times do
  project = FactoryBot.create(:random)
  user = User.find(project.user_id)

  puts "Created project #{project.name} for #{user.first_name} #{user.last_name}"
end

puts 'creating test standard user'
user = FactoryBot.build(:standard)
user.email = 'standard@test.com'
user.first_name = 'standard_first'
user.last_name = 'standard_last'

user.save

puts 'created test standard user'
puts
puts
puts "    Email: #{user.email}"
puts "    Password: #{user.password}"
puts
puts



puts 'creating test fundraiser user'
user = FactoryBot.build(:fundraiser)
user.email = 'fundraiser@test.com'
user.first_name = 'fundraiser_first'
user.last_name = 'fundraiser_last'

user.save

puts 'created test fundraiser user'
puts
puts
puts "    Email: #{user.email}"
puts "    Password: #{user.password}"
puts
puts



puts 'end of seeding'
