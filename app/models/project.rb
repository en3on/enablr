require 'date'

class Project < ApplicationRecord

  include Categories

  validates :name,
            :description,
            :target_amount,
            :target_date,
            :category,
            presence: true

  validates :description, length: { maximum: 1000 }

  validates :target_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :date_is_in_the_future

  has_many :perks, dependent: :destroy
  has_many :project_enablrs, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :picture

  before_create :set_initial_values, :assign_hardware_status

  def sort_perks_by_min_amount
    perks.order(minimum_amount: :asc)
  end

  def project_comments
    Comment.where(project_id: id).order(created_at: :desc)
  end

  def percentage
    (current_amount.to_f / target_amount) * 100.0
  end

  def decrease_amounts(amount)
    decrement :current_amount, amount
    decrement :backer_amount, 1
    save
  end

  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end

  def assign_hardware_status
    self.hardware = Categories.hardware?(category)
  end

  def date_is_in_the_future
    return if target_date.nil?

    formatted_date = target_date.to_datetime
    target_date = formatted_date

    return if target_date > DateTime.now

    errors[:target_date] << 'Target Date must be in the future'
  end
end
