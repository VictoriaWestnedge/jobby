class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :jobs
  has_many :my_jobs
  has_many :reviews
  has_many :employer_messages, class_name: 'Message', foreign_key: 'employer_id'
  has_many :employee_messages, class_name: 'Message', foreign_key: 'employee_id'
  validates :nickname, presence: true
end
