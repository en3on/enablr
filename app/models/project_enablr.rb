class ProjectEnablr < ApplicationRecord
  validates :user_id,
            :project_id,
            :pledged_amount,
            presence: true

  validates :pledged_amount, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :user
  belongs_to :project
end
