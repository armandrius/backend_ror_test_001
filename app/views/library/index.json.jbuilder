json.cache! @purchases do
  json.contents @purchases do |purchase|
    json.partial! 'contents/show', content: purchase.content
    json.remaining_time purchase.remaining_time_seconds
  end
end
