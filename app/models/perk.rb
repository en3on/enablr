class Perk < ApplicationRecord
  has_many :enablers, dependent: :destroy
end
