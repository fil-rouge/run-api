json.data do
    json.id @group.id
    json.type "group"
    json.attributes do
      json.name @group.name
      json.description @group.description
      json.created_at @group.created_at
      json.admin_id @group.admin_id
  end
end