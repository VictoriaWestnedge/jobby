class Job < ApplicationRecord
  belongs_to :user
  has_many :my_jobs
  validates :name, :description, :category, :address, :city, :qty_hour, presence: true
  validates :price_per_hour, :start_date, :end_date, :start_time, :end_time, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
