@json.circuits @circuits do |c|
  json.circuit_id c.id
  json.distance c.distance
  json.description c.description
  json.note c.note
  json.time c.time
  json.date c.date
end