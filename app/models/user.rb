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

  validate :password_valid?

  has_many :project_enablrs, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_one_attached :avatar

  private

  def password_valid?
    return unless password.present?

    valid_pass = /\A(?=.*[A-Z]+)(?=.*[a-z]+)(?=.*\d{2,})/

    return if password =~ valid_pass

    errors[:password] << "Must contain at least:\n- 1 lowercase letter\n- 1 uppercase letter\n- 2 numbers"
  end
end
