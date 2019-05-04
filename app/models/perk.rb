class Perk < ApplicationRecord
  has_many :enablers, dependent: :destroy
  belongs_to :project

  validates :name,
            :minimum_amount,
            :rewards,
            presence: true
end
