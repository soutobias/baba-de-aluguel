class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :services
  has_one :babysitter
  has_many :babysitters, through: :services
  validates :email, presence: true
  validates :name, presence: true
  validates :location, presence: true
end
