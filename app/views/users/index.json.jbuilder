json.data do
  json.array! @user do |u|
    json.id u.id
    json.type "users"
    json.attributes do
      json.name u.name
      json.surname u.surname
      json.email u.email
      json.age u.age
      json.phoneNumber u.phone_number
      json.lastSignInAt u.last_sign_in_at
      json.createdAt u.created_at
      json.signInCount u.sign_in_count
      json.lastSignInIp u.last_sign_in_ip
    end
  end
end