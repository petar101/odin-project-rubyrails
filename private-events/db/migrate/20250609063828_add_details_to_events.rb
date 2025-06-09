class AddDetailsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :name, :string
    add_column :events, :location, :string
    add_column :events, :date, :datetime
  end
end
