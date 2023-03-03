class Dinner < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :category, :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
