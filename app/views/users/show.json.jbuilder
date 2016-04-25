json.data do
  json.id @user.id
  json.type "users"
  json.attributes do
    json.name @user.name
    json.surname @user.surname
    json.email @user.email
    json.age @user.age
    json.phoneNumber @user.phone_number
    json.lastSignInAt @user.last_sign_in_at
    json.createdAt @user.created_at
    json.signInCount @user.sign_in_count
    json.lastSignInIp @user.last_sign_in_ip
    json.totalDistance @user.get_stats[:total_distance]
    json.totalTime @user.get_stats[:total_time]
    json.circuitsNumber @user.get_stats[:circuits_number]
  end
end