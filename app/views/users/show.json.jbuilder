json.data do
  json.array  do
    json.id @user.id
    json.type "users"
    json.attributes do
      json.name @user.name
      json.surname @user.surname
      json.email @user.email
      json.age @user.age
      json.phone_number @user.phone_number
      json.last_sign_in_at @user.last_sign_in_at
      json.created_at @user.created_at
      json.sign_in_count @user.sign_in_count
      json.last_sign_in_ip @user.last_sign_in_ip
    end
  end
end