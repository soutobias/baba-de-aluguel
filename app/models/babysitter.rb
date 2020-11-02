class Babysitter < ApplicationRecord
  belongs_to :user
  has_many :services, dependent: :destroy
  has_many :users, through: :services
  validates :experience, presence: true
  validates :skill, presence: true
  validates_inclusion_of :skill, in: %w(cozinhar limpar ensinar brincar)
  validates :price, presence: true
end
