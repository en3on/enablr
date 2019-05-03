class ProjectEnablr < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :project
  
  validates :user_id,
            :project_id,
            :pledged_amount,
            presence: true

  validates :pledged_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :own_project?

  def self.already_enabled?(project_id, user_id)
    !ProjectEnablr.find_by(user_id: user_id, project_id: project_id).nil?
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
