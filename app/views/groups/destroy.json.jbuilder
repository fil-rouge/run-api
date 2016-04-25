json.data do
    json.id @group.id
    json.type "groups"
    json.attributes do
      json.name @group.name
      json.description @group.description
      json.createdat @group.created_at
      json.adminid @group.admin_id
  end
end