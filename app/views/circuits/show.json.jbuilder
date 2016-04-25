json.data do
  json.id @circuit.id
  json.type "circuits"
  json.attributes do
    json.circuitid @circuit.id
    json.distance @circuit.distance
    json.description @circuit.description
    json.note @circuit.note
    json.time @circuit.time
    json.date @circuit.date
  end
  json.relationships do
    json.points do
      json.data do
        json.array! @circuit.points do |p|
          json.type "points"
          json.id p.id
          json.latitude p.latitude
          json.longitude p.longitude
        end
      end
    end
  end
end
