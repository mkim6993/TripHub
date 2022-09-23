json.extract! trip_user, :id, :trip_id, :user_id, :created_at, :updated_at
json.url trip_user_url(trip_user, format: :json)
