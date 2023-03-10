class Job < ApplicationRecord
  belongs_to :user
  has_many :my_jobs

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :description, :category, :address, :city, :qty_hour, presence: true
  validates :price_per_hour, :end_date, :start_time, :end_time, presence: true

  has_one_attached :photo


  validate :start_date_after_today
  validate :end_date_after_start_date

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

    private

    def start_date_after_today
      if start_date.nil?
        errors.add(:start_date, 'cannot be blank')
      elsif start_date <= Date.today
        errors.add(:start_date, 'must be after the current date')
      end

    end

    def end_date_after_start_date
      if start_date.nil?
        errors.add(:start_date, 'cannot be blank')
      elsif end_date <= start_date
      errors.add(:end_date, 'Must be after the star date')
      end
    end

end
