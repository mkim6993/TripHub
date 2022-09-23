class CreateTripLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_locations do |t|
      t.string :location_id
      t.string :trip_id

      t.timestamps
    end
  end
end
