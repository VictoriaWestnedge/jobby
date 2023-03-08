class MyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :job_id, uniqueness: {scope: :user_id}
  enum status: [:apply, :pending, :accepted, :canceled, :rejected  ]

end
