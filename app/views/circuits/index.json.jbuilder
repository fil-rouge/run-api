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
      json.nbrun c.nbRun
      json.title c.title
    end
    json.relationships do
      json.points do
        json.data do
          json.array! c.points do |p|
            json.type "points"
            json.id p.id
            json.latitude p.latitude
            json.longitude p.longitude
          end
        end
      end
    end
  end
end
