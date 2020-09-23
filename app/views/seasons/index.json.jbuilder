json.cache! @seasons do
  json.seasons @seasons, partial: 'contents/show', as: :content
end
