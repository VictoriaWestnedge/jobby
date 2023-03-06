class MyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :status, presence: true
  validates :job_id, uniqueness: true
end
