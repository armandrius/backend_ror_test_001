json.id content.id
json.type content.class.name.downcase
json.title content.title
json.plot content.plot
json.number content.number if content.has_attribute? :number
json.created_at content.created_at
