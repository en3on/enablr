class Perk < ApplicationRecord
  has_many :enablers, dependent: :destroy
  belongs_to :project

  validates :name,
            :minimum_amount,
            :rewards,
            presence: true

  before_create :set_unlimited

  private
  def set_unlimited
    self.unlimited = amount_left == 0
  end
end
