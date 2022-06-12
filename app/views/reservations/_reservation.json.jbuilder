json.extract! reservation, :id, :reservation_id, :date, :time_from, :time_to, :price_list_id, :track_id, :shoe_id, :client_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
