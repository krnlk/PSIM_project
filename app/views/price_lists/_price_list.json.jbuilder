json.extract! price_list, :id, :price_list_id, :price, :item_type, :weekday, :time_from, :time_to, :current, :created_at, :updated_at
json.url price_list_url(price_list, format: :json)
