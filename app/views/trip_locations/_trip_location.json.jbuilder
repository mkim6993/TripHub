json.extract! trip_location, :id, :location_id, :trip_id, :created_at, :updated_at
json.url trip_location_url(trip_location, format: :json)
