puts 'Start of seeding'

puts 'Creating projects with perks...'

10.times do
  project = FactoryBot.create(:random)

  rand(1..5).times do
    num = rand(1..18)
    project.picture.attach(io: File.open("app/assets/images/test-images/#{num}.jpg"), filename: "#{num}.jpg")

    puts "Attaching picture #{num}"
  end

  puts "Creating project: #{project.name}"

  rand(1..10).times do
    perk = FactoryBot.build(:random_perk_without_project)
    perk.project_id = project.id

    puts "  Creating perk: #{perk.name}"

    perk.save
  end
end

puts 'Creating test users...'

fundraiser = FactoryBot.build(:fundraiser)
fundraiser.email = 'fundraiser@test.com'

standard = FactoryBot.build(:standard)
standard.email = 'standard@test.com'

fundraiser.save
standard.save

2.times { puts }
puts 'Fundraiser User'
puts "  email: #{fundraiser.email}"
puts "  password: #{fundraiser.password}"

2.times { puts }
puts 'Standard User'
puts "  email: #{standard.email}"
puts "  password: #{standard.password}"
