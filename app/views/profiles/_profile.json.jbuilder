json.extract! profile, :id, :description, :picture, :hit, :created_at, :updated_at
json.url profile_url(profile, format: :json)
