class Service < ApplicationRecord
  belongs_to :user
  belongs_to :babysitter
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :duration, presence: true
  validates :total_price, presence: true
  validates_inclusion_of :duration, in: 1..12
end
