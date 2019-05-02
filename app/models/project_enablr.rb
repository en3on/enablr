class ProjectEnablr < ApplicationRecord
  validates :user_id,
            :project_id,
            :pledged_amount,
            presence: true

  validates :pledged_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :already_enabled

  validate :is_own_project

  belongs_to :user
  belongs_to :project

  private
  def already_enabled
    return unless user_id.present?

    return unless project_id.present?

    user = User.find(user_id)

    return if user.project_enablrs.where("project_id = #{project_id}").empty?

    errors[:project_id] << 'You can not back the same project more than once'
  end

  def is_own_project
    return unless user_id.present?

    return unless project_id.present?

    user = User.find(user_id)

    return unless user.fundraiser

    return if user.projects.where("id = #{project_id}").empty?

    errors[:project_id] << 'You can not back your own project'
  end
end
