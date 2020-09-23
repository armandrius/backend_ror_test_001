json.id content.id
json.type content.class.name.downcase
json.title content.title
json.plot content.plot
json.number content.number if content.has_attribute? :number
if content.respond_to? :episodes
  json.episodes do
    json.array! content.episodes do |episode|
      json.id episode.id
      json.season_id content.id
      json.title content.title
      json.plot content.plot
      json.number content.number
      json.created_at content.created_at.to_i
    end
  end
end
json.created_at content.created_at.to_i
