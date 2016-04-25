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
  json.relationships do
    json.circuits do
      json.data do
        json.array! @user.circuits do |c|
          json.id c.id
          json.type "circuits"
          json.attributes do
            json.distance c.distance
            json.description c.description
            json.note c.note
            json.time c.time
            json.date c.date
            json.relationships do
              json.points do
                json.data do
                  json.array! c.points do |p|
                    json.type "points"
                    json.id p.id
                    json.attributes do
                      json.lat p.latitude
                      json.lng p.longitude
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end