FactoryBot.define do
  factory :fundraiser, class: User do
    email { Faker::Internet.email }
    password { 'Password123' }
    password_confirmation { 'Password123' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    fundraiser { true }
    country { 'Australia' }
    city { 'Melbourne' }
  end

  factory :standard, class: User do
    email { Faker::Internet.email }
    password { 'Password123' }
    password_confirmation { 'Password123' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    fundraiser { false }
    country { 'Australia' }
    city { 'Melbourne' }
  end
end
