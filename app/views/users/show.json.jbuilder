json.data do
  json.user do
    json.id @user.id
    json.name @user.name
    json.surname @user.surname
    json.is_admin @user.is_admin
    json.phone_number @user.phone_number
    json.age @user.age
    json.email @user.email
    json.last_sign_in @user.last_sign_in_at

    json.circuits @user.circuits do |c|
      json.circuit c
    end

    json.groups @user.groups do |g|
      json.group g
    end

  end
end