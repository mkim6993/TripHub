class TripLocationTimes < ActiveRecord::Migration[7.0]
  def change
    add_column :trip_locations, :start_time, :string
    add_column :trip_locations, :end_time, :string
  end
end
