json.cache! @purchases do
  json.contents @purchases do |purchase|
    json.partial! 'contents/show', content: purchase.content
    json.video_quality purchase.purchase_option.video_quality
    json.remaining_time purchase.remaining_time_seconds
  end
end
