class Dinner < ApplicationRecord
  belongs_to :user

  validates :title, :category, :date, presence: true
end
