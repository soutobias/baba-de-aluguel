class Service < ApplicationRecord
  belongs_to :user
  belongs_to :babysitter
  validates :date_time, presence: true
  validates :duration, presence: true
  validates :total_price, presence: true
  validates_inclusion_of :duration, in: 1..10
end
