class Perk < ApplicationRecord
  has_many :enablers, dependent: :destroy
  belongs_to :project
end
