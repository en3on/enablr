class Enabler < ApplicationRecord
  has_many :comments, dependent: :destroy 
end
