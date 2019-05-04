FactoryBot.define do
  factory :unlimited_perk, class: Perk do
    minimum_amount { rand(1..1000) }
    unlimited { true }
    enablr_amount { rand(0..10) }
    project_id { create(:random).id }
  end

  factory :limited_perk, class: Perk do
    minimum_amount { rand(1..1000) }
    unlimited { false }
    enablr_amount { rand(0..10) }
    project_id { create(:random).id }
    amount_left { rand(2..10) }
  end
end
