json.cache! @purchase do
  json.partial! 'purchases/show', purchase: @purchase
end
