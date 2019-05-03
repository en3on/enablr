class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name,
            :last_name,
            :country,
            :city,
            presence: true

  has_many :project_enablrs, dependent: :destroy
  has_many :projects, dependent: :destroy
end
