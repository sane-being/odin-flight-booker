json.extract! flight, :id, :departure_datetime, :flight_duration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
