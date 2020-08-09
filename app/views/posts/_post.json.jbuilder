json.extract! post, :id, :title, :subtitle, :author, :created_at, :updated_at
json.url post_url(post, format: :json)
