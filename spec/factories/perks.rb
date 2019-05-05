FactoryBot.define do
  factory :unlimited_perk, class: Perk do
    name { Faker::Book.title }
    minimum_amount { rand(1..1000) }
    amount_left { -1 }
    enablr_amount { rand(0..10) }
    project_id { create(:random).id }
    rewards { 'a' * rand(5..1000) }
  end

  factory :limited_perk, class: Perk do
    name { Faker::Book.title }
    minimum_amount { rand(1..1000) }
    enablr_amount { rand(0..10) }
    project_id { create(:random).id }
    amount_left { rand(2..10) }
    rewards { 'a' * rand(5..1000) }
  end
end
