json.id purchase.id
json.user_id purchase.user_id
json.purchase_option_id purchase.purchase_option_id
json.content do
  json.partial! 'contents/show', content: purchase.content
end
json.remaining_time purchase.remaining_time_seconds
