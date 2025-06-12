class AddMissingFields < ActiveRecord::Migration[8.0]
  def change
    # Add city to airports
    add_column :airports, :city, :string, null: false

    # Add airport references to flights
    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
    add_reference :flights, :arrival_airport, null: false, foreign_key: { to_table: :airports }

    # Add references to seats
    add_reference :seats, :flight, null: false, foreign_key: true
    add_reference :seats, :user, null: false, foreign_key: true
  end
end
