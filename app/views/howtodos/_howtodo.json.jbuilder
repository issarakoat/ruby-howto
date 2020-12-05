json.extract! howtodo, :id, :title, :description, :created_at, :updated_at
json.url howtodo_url(howtodo, format: :json)
