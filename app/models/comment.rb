class Comment < ApplicationRecord
  belongs_to :project_enablr
  belongs_to :project

  validates :content, presence: true
end
