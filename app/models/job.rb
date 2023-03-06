class Job < ApplicationRecord
  belongs_to :user
  has_many :my_jobs
  validates :name, :description, :category, :address, :city, :qty_hour, presence: true
  validates :price_per_hour, :start_date, :end_date, :start_time, :end_time, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum :category, {
    painting: 1,
    babysitting: 2,
    deliveries: 3,
    cleaning: 4,
    petsitting: 5,
    furniture_assembly: 6
    }
end
