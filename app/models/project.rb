class Project < ApplicationRecord
  validates :description, length: { maximum: 500 }
  validates :hardware, presence: true
  validates :target_amount, presence: true

  has_many :enablers, dependent: :destroy
  has_many :perks, dependent: :destroy

  before_create :set_initial_values

  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end
end
