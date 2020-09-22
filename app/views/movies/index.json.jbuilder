json.movies @movies do |movie|
  json.partial! 'contents/show', content: movie
end
