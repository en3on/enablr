FactoryBot.define do
  factory :project_enablr do
    pledged_amount { 40.00 }
  end

  factory :complete_project_enablr, class: ProjectEnablr do
    pledged_amount { 100.00 }
    project_id { create(:random).id }
    user_id { Project.find(project_id).user_id }
  end
end
