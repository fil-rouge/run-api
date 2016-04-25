json.data do
  json.array! @circuits do |c|
    json.id c.id
    json.type "circuits"
    json.attributes do
      json.circuitid c.id
      json.distance c.distance
      json.description c.description
      json.note c.note
      json.time c.time
      json.date c.date
    end
  end
end