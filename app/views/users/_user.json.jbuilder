json.extract! user, :id, :username, :name, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
