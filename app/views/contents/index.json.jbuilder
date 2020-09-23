json.cache! @contents do
  json.contents @contents, partial: 'contents/show', as: :content
end
