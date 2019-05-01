class Project < ApplicationRecord
  validates :name, :description, :target_amount, :target_date, presence: true
  
  validates :description, length: { maximum: 500 }

  validates :target_amount, numericality: { greater_than_or_equal_to: 1 }

  has_many :enablers, dependent: :destroy
  has_many :perks, dependent: :destroy

  before_create :set_initial_values

  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end
end
