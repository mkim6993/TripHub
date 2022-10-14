json.extract! trip, :id, :trip_id, :create_by, :date_created, :trip_date, :title, :description, :upvotes, :shares, :public, :parent, :created_at, :updated_at
json.url trip_url(trip, format: :json)
