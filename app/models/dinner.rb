class Dinner < ApplicationRecord
  belongs_to :user

  validates :title, :category, :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
