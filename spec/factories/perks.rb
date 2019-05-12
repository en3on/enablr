FactoryBot.define do
  factory :unlimited_perk, class: Perk do
    name { Faker::Book.title }
    minimum_amount { rand(1..100) }
    amount_left { -1 }
    enablr_amount { rand(0..10) }
    project_id { create(:random).id }
    rewards { 'a' * rand(5..1000) }
  end

  factory :limited_perk, class: Perk do
    name { Faker::Book.title }
    minimum_amount { rand(1..100) }
    enablr_amount { rand(0..10) }
    project_id { create(:random).id }
    amount_left { rand(2..10) }
    rewards { 'a' * rand(5..1000) }
  end

  factory :random_perk_without_project, class: Perk do
    name { Faker::Book.title }
    minimum_amount { rand(-1..500) }
    enablr_amount { rand(0..10) }
    amount_left { rand(0..100) }
    rewards { Faker::Lorem.paragraph }
    estimated_delivery { Faker::Date.forward(1000) }
    not_deliverable { Faker::Boolean.boolean }
  end
end
