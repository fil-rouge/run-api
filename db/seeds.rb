# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # clean db
  Town.delete_all
  County.delete_all
  Area.delete_all
  Country.delete_all
  Tag.delete_all
  Point.delete_all
  Parcour.delete_all
  User.delete_all



  #  Tags
  tag = Tag.create(value: "VilleDesLumieres")

  # Points
  p1 = Point.create(latitude: 1, longitude: 1)
  p2 = Point.create(latitude: 2, longitude: 2)
  p3 = Point.create(latitude: 3, longitude: 3)
  p4 = Point.create(latitude: 4, longitude: 4)

  # parcours
  parcours = Parcour.create(distance: "400", note: 4, points: [p1,p2,p3,p4], tags: [tag])

  # Users
  user = User.create(email: 'test@test.com', password: 'password',name: 'name',surname: 'surname')

  # Countries
  france = Country.create(name: 'France')
  espagne = Country.create(name: 'Espagne')
  suisse = Country.create(name: 'Suisse')
  allemagne = Country.create(name: 'Allemagne')

  # Areas
  area = Area.create(name: 'rhones-alpes', country_id: france.id)

  # Counties
  county = County.create(name: 'rhone', area_id: area.id)

  # Towns
  lyon = Town.create(name: 'Lyon', radius: 10, latitude: 45.750000 , longitude: 4.850000, county_id: county.id)
