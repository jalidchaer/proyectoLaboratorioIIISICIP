json.extract! proyecto, :id, :filename, :content_type, :file_contents, :created_at, :updated_at
json.url document_url(proyecto, format: :json)