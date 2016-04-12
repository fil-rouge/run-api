json.data do
  json.group do
    json.name @group.name
    json.description @group.description
    json.created_at @group.created_at
    json.id @group.id
  end
end