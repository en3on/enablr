class Perk < ApplicationRecord
  has_many :project_enablrs, dependent: :destroy
  belongs_to :project

  validates :name,
            :minimum_amount,
            :rewards,
            presence: true

  before_create :set_unlimited, :set_enablr_amount

  def self.is_own_project?(user_id, project_id)
    user_id == Project.find(project_id).user_id
  end

  private

  def set_enablr_amount
    self.enablr_amount = 0
  end

  def set_unlimited
    self.unlimited = amount_left == -1
  end
end
