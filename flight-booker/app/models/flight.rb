class Flight < ApplicationRecord
  validates :departure_time, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :seats
  has_many :users, through: :seats
end
