FactoryBot.define do
  factory :software, class: Project do
    name { 'Test Project' }
    description { 'Test Project Description' }
    target_amount { 5000 }
    target_date { '20 Apr 2020' }
    country { 'Australia' }
    city { 'Melbourne' }
    hardware { false }
    category { 'App' }
  end
end
