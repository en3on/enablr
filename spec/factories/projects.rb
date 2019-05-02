FactoryBot.define do
  factory :software, class: Project do
    name { 'Test Project' }
    description { 'Test Project Description' }
    target_amount { 5000 }
    target_date { '20 Apr 2020' }
    country { 'Australia' }
    city { 'Melbourne' }
    category { ProjectCategories.categories[1][0] }
    user_id { create(:fundraiser).id }
  end

  factory :hardware, class: Project do
    name { 'Test Hardware Project' }
    description { 'Test Project Description' }
    target_amount { 5000 }
    target_date { '20 Apr 2020' }
    country { 'Australia' }
    city { 'Melbourne' }
    category { ProjectCategories.categories.last }
    user_id { create(:fundraiser).id }
  end

  factory :random, class: Project do
    name { 'Test Project' }
    description { 'Test Project Description' }
    target_amount { 5000 }
    target_date { '20 Apr 2020' }
    country { 'Australia' }
    city { 'Melbourne' }
    category { ProjectCategories.categories.sample[0] }
    user_id { create(:fundraiser).id }
  end
end
