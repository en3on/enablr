FactoryBot.define do
  factory :fundraiser, class: User do
    email { 'test@test.com' }
    password { 'Password123' }
    password_confirmation { 'Password123' }
    first_name { 'first' }
    last_name { 'last' }
    fundraiser { true }
    country { 'Australia' }
    city { 'Melbourne' }
  end
end
