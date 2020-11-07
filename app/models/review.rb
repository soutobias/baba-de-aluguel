class Review < ApplicationRecord
  belongs_to :babysitter
  belongs_to :user
  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 0..5
end
