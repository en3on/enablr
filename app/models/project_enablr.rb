class ProjectEnablr < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :project
  belongs_to :perk
  
  validates :user_id,
            :project_id,
            :pledged_amount,
            presence: true

  validates :pledged_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :own_project?

  def self.already_enabled?(project_id, user_id)
    !ProjectEnablr.find_by(user_id: user_id, project_id: project_id).nil?
  end

  def can_refund?
    (DateTime.now.to_i - created_at.to_i) / 86_400 < 30
  end

  def percentage_of_project
    total = Project.find(project_id).target_amount

    (pledged_amount.to_f / total) * 100.0
  end

  private

  def own_project?
    return unless user_id.present?

    return unless project_id.present?

    user = User.find(user_id)

    return unless user.fundraiser

    return if user.projects.where("id = #{project_id}").empty?

    errors[:project_id] << 'You can not back your own project'
  end
end
