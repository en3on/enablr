class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :target_amount, presence: true, numericality: { greater_than: 0 }
  validates :target_date, presence: true

  has_many :enablers, dependent: :destroy
  has_many :perks, dependent: :destroy

  before_create :set_initial_values

  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end
end
