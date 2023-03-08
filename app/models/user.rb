class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :jobs
  has_many :my_jobs
  has_many :reviews
  has_many :messages, class_name: 'Message', foreign_key: 'id'
  validates :nickname, presence: true
end
