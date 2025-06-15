# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Airport.destroy_all
Flight.destroy_all

# Create airports
airports = [
  { city: "San Francisco", code: "SFO" },
  { city: "New York", code: "NYC" },
  { city: "Los Angeles", code: "LAX" },
  { city: "Chicago", code: "ORD" },
  { city: "London", code: "LHR" },
  { city: "Paris", code: "CDG" },
  { city: "Tokyo", code: "HND" },
  { city: "Sydney", code: "SYD" }
]

airports.each do |airport_data|
  Airport.create!(airport_data)
end

puts "Created #{Airport.count} airports"

# Create flights
# Domestic flights (shorter duration)
domestic_routes = [
  { from: "SFO", to: "LAX", duration: 1 },  # San Francisco to Los Angeles
  { from: "SFO", to: "NYC", duration: 6 },  # San Francisco to New York
  { from: "LAX", to: "NYC", duration: 5 },  # Los Angeles to New York
  { from: "NYC", to: "ORD", duration: 2 },  # New York to Chicago
  { from: "ORD", to: "LAX", duration: 4 }   # Chicago to Los Angeles
]

# International flights (longer duration)
international_routes = [
  { from: "NYC", to: "LHR", duration: 7 },  # New York to London
  { from: "LHR", to: "CDG", duration: 1 },  # London to Paris
  { from: "LAX", to: "HND", duration: 11 }, # Los Angeles to Tokyo
  { from: "HND", to: "SYD", duration: 9 },  # Tokyo to Sydney
  { from: "SYD", to: "SFO", duration: 13 }  # Sydney to San Francisco
]

# Generate flights for the next 7 days
(0..6).each do |day|
  # Domestic flights
  domestic_routes.each do |route|
    # Create 3 flights per day for each route
    3.times do |hour_offset|
      departure_time = (Date.today + day).beginning_of_day + (8 + hour_offset * 4).hours

      Flight.create!(
        departure_airport: Airport.find_by(code: route[:from]),
        arrival_airport: Airport.find_by(code: route[:to]),
        departure_time: departure_time,
        duration: route[:duration]
      )
    end
  end

  # International flightsç

  international_routes.each do |route|
    # Create 1 flight per day for each international route
    departure_time = (Date.today + day).beginning_of_day + 10.hours

    Flight.create!(
      departure_airport: Airport.find_by(code: route[:from]),
      arrival_airport: Airport.find_by(code: route[:to]),
      departure_time: departure_time,
      duration: route[:duration]
    )
  end
end

puts "Created #{Flight.count} flights"
