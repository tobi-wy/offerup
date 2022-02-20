json.extract! item, :id, :title, :description, :user_id, :photo, :location, :category_id, :price, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
