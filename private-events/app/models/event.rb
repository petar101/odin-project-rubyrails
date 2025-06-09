class Event < ApplicationRecord
  class Date
    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end
  end

  class Location
    def initialize(place)
      @place = place
    end
  end

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
