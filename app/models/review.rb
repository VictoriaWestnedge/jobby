class Review < ApplicationRecord
  belongs_to :user
  validates :description, length: { minimum: 10 }
end
