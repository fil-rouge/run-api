json.parcours @user do |u|
  json.id u.id
  json.name u.name
  json.surname u.surname
  json.phone_number u.phone_number
  json.age u.age
  json.email u.email
  json.last_sign_in u.last_sign_in_at

  json.circuits u.circuits do |c|
    json.circuit c
  end

  json.groups u.groups do |g|
    json.group g
  end
end