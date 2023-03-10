class Job < ApplicationRecord
  belongs_to :user
  has_many :my_jobs

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :description, :category, :address, :city, :qty_hour, presence: true
  validates :price_per_hour, :start_date, :end_date, :start_time, :end_time, presence: true

  has_one_attached :photo

  include PgSearch::Model
    pg_search_scope :search_by_name_and_description_and_city,
    against: [ :name, :description, :city ],
    using: {
      tsearch: { prefix: true }
    }

#  enum :category, {
#     painting: 1,
#     babysitting: 2,
#     deliveries: 3,
#     cleaning: 4,
#     petsitting: 5,
#     others: 6
#     }

end
