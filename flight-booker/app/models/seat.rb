class Seat < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  validates :user_id, presence: true
  validates :flight_id, presence: true
end
