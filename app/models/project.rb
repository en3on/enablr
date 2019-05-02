require 'date'
require_relative 'modules/project_helper'

class Project < ApplicationRecord

  include ProjectCategories

  validates :name,
            :description,
            :target_amount,
            :target_date,
            :category,
            presence: true
  
  validates :description, length: { maximum: 500 }

  validates :target_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :date_is_in_the_future

  has_many :perks, dependent: :destroy
  has_many :project_enablrs, dependent: :destroy

  before_create :set_initial_values, :assign_hardware_status

  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end

  def assign_hardware_status
    self.hardware = ProjectCategories.hardware?(category)
  end

  def date_is_in_the_future
    return if target_date.nil?

    formatted_date = target_date.to_datetime
    target_date = formatted_date

    return if target_date > DateTime.now

    errors[:target_date] << 'Target Date must be in the future'
  end
end
