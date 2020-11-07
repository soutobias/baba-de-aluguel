class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo, dependent: :destroy
  has_many :services
  has_one :babysitter
  has_many :babysitters, through: :services
  validates :email, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :photo, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :reviews
end
