class Airport < ApplicationRecord
  validates :city, presence: true
  validates :code, presence: true, uniqueness: true, length: { is: 3 }

  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id"
  has_many :arriving_flights,  class_name: "Flight", foreign_key: "arrival_airport_id"
end
