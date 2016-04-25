json.data do
  json.array! @user do |u|
    json.id u.id
    json.type "users"
    json.attributes do
      json.name u.name
      json.surname u.surname
      json.email u.email
      json.age u.age
      json.phonenumber u.phone_number
      json.lastsigninat u.last_sign_in_at
      json.createdat u.created_at
      json.signincount u.sign_in_count
      json.lastsigninip u.last_sign_in_ip
    end
  end
end