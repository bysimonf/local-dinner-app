class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dinner

  validates :dinner, uniqueness: { scope: :user, message: "You already joined this dinner" }
end
