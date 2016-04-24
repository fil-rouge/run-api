json.data do
  json.array! @user do |u|
    json.id u.id
    json.type "user"
    json.attributes do
      json.name u.name
      json.surname u.surname
      json.email u.email
      json.age u.age
      json.phone_number u.phone_number
      json.last_sign_in_at u.last_sign_in_at
      json.created_at u.created_at
      json.sign_in_count u.sign_in_count
      json.last_sign_in_ip u.last_sign_in_ip
    end
  end
end