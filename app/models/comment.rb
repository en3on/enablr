class Comment < ApplicationRecord
  belongs_to :project_enablr

  validates :content, presence: true
end
