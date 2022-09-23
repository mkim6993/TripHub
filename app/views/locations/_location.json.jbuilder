json.extract! location, :id, :location_id, :name, :description, :address, :contact, :price, :image, :open_times, :created_at, :updated_at
json.url location_url(location, format: :json)
