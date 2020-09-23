json.cache! @movies do
  json.movies @movies, partial: 'contents/show', as: :content
end
