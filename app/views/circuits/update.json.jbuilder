json.data do
  json.id @circuit.id
  json.type "circuit"
  json.attributes do
    json.circuit_id @circuit.id
    json.distance @circuit.distance
    json.description @circuit.description
    json.note @circuit.note
    json.time @circuit.time
    json.date @circuit.date
  end
end
