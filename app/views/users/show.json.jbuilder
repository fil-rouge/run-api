json.data do
  json.id @user.id
  json.type "users"
  json.attributes do
    json.name @user.name
    json.surname @user.surname
    json.email @user.email
  end
end