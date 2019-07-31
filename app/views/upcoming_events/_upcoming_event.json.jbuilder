json.extract! upcoming_event, :id, :title, :content, :date, :created_at, :updated_at
json.url upcoming_event_url(upcoming_event, format: :json)
