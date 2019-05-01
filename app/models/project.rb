require 'date'

class Project < ApplicationRecord
  validates :name, :description, :target_amount, :target_date, presence: true
  
  validates :description, length: { maximum: 500 }

  validates :target_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :date_is_in_the_future

  has_many :enablers, dependent: :destroy
  has_many :perks, dependent: :destroy

  before_create :set_initial_values

  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end

  def date_is_in_the_future
    return if target_date.nil?

    formatted_date = target_date.to_datetime
    target_date = formatted_date

    if target_date <= DateTime.now
      errors[:target_date] << 'Target Date must be in the future'
    end
  end
end
