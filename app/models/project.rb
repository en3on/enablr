class Project < ApplicationRecord
  has_many :enablers, dependent: :destroy
  has_many :perks, dependent: :destroy
end
