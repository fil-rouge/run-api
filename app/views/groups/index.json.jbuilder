json.data do
  json.array! @groups do |g|
    json.id g.id
    json.type "groups"
    json.attributes do
      json.name g.name
      json.description g.description
      json.createdat g.created_at
    end
  end
end