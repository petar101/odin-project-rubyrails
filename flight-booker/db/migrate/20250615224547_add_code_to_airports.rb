class AddCodeToAirports < ActiveRecord::Migration[8.0]
  def change
    add_column :airports, :code, :string
    add_index :airports, :code
  end
end
