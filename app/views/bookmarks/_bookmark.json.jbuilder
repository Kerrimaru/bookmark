json.extract! bookmark, :id, :url, :screenshot, :title, :created_at, :updated_at, :tags
json.url bookmark_url(bookmark, format: :json)
