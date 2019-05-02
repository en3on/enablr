require 'date'

class Project < ApplicationRecord
  validates :name, :description, :target_amount, :target_date, presence: true

  validates :name,
            :description,
            :target_amount,
            :target_date,
            :category,
            presence: true
  
  validates :description, length: { maximum: 500 }

  validates :target_amount, numericality: { greater_than_or_equal_to: 1 }

  validate :date_is_in_the_future

  has_many :enablers, dependent: :destroy
  has_many :perks, dependent: :destroy

  before_create :set_initial_values


  @software_categories = [
                          'Mobile App',
                          'Mobile Game',
                          'Antivirus and Security',
                          'Data Storage',
                          'Development',
                          'Web App',
                          'Console Game',
                          'Computer Game',
                          'Operating System',
                          'Office and Business',
                          'Image, Video and Audio',
                          'Personal Finance, Tax and Legal',
                          'Education',
                          'Web and Desktop Publishing',
                          'Virtual Reality',
                          'Other'
                         ]

   @hardware_categories = [
                          'Cameras & Photo',
                          'Cell Phones',
                          'Smart Watches',
                          'Accessories',
                          'Computers',
                          'Tablets',
                          'Network Hardware',
                          'TV, Video and Home Audio',
                          'Portable Audio and Headphones',
                          'Car Electronics',
                          'Home Surveillance',
                          'Smart Home',
                          'Video and PC Gaming',
                          'Virtual Reality',
                          'Other'
                        ]

  def self.categories
    categories = {}

    @software_categories.each do |category|
      categories[category] = 'software'
    end

    @hardware_categories.each do |category|
      categories[category] = 'hardware'
    end

    categories
  end


  private
  def set_initial_values
    self.current_amount = 0
    self.backer_amount = 0
  end

  def date_is_in_the_future
    return if target_date.nil?

    formatted_date = target_date.to_datetime
    target_date = formatted_date

    return if target_date > DateTime.now

    errors[:target_date] << 'Target Date must be in the future'
  end
end
