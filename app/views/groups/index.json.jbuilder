json.data do
  json.groups @groups do |g|
    json.name g.name
    json.description g.description
    json.created_at g.created_at
    json.id g.id
  end
end