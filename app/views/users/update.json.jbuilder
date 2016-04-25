json.data do
  json.id @user.id
  json.type "users"
  json.attributes do
    json.name @user.name
    json.surname @user.surname
    json.email @user.email
    json.age @user.age
    json.phonenumber @user.phone_number
    json.lastsigninat @user.last_sign_in_at
    json.createdat @user.created_at
    json.signincount @user.sign_in_count
    json.lastsigninip @user.last_sign_in_ip
    json.totaldistance @user.get_stats[:total_distance]
    json.totaltime @user.get_stats[:total_time]
    json.circuitsnumber @user.get_stats[:circuits_number]
  end
end