require_relative 'project_names.rb'

puts 'Start of seeding'

puts 'Creating projects with perks...'

10.times.each do |i|
  @project = FactoryBot.build(:random)
  @project.name = @names[i]
  @project.save

  rand(1..5).times do
    num = rand(1..18)
    @project.picture.attach(io: File.open("app/assets/images/test-images/#{num}.jpg"), filename: "#{num}.jpg")

    puts "Attaching picture #{num}"
  end

  puts "Creating project: #{@project.name}"

  rand(1..10).times do
    perk = FactoryBot.build(:random_perk_without_project)
    perk.project_id = @project.id

    puts "  Creating perk: #{perk.name}"

    perk.save
  end

  rand(1..10).times do
    user = FactoryBot.create(:standard)
    perk = @project.perks.sample

    enablr = user.project_enablrs.new
    enablr.pledged_amount = perk.minimum_amount
    enablr.project_id = @project.id
    enablr.perk_id = perk.id

    @project.increment :current_amount, enablr.pledged_amount
    @project.increment :backer_amount, 1
    perk.increment :enablr_amount, 1

    enablr.save
    @project.save
    perk.save

    comment = enablr.comments.new
    comment.content = Faker::Quote.yoda
    comment.project_id = @project.id

    comment.save
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
