# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # clean db

  Point.delete_all
  User.delete_all
  Group.delete_all
  Circuit.delete_all


  # Points
  p1 = Point.create(latitude: 1, longitude: 1)
  p2 = Point.create(latitude: 2, longitude: 2)
  p3 = Point.create(latitude: 3, longitude: 3)
  p4 = Point.create(latitude: 4, longitude: 4)

  # Circuits

  c1 = Circuit.create(distance: 2000, note: 4,  description: "c'est dur lol", points: [p1,p2])
  c2 = Circuit.create(distance: 50, note: 4,  description: "easy", points: [p1,p2])
  c3 = Circuit.create(distance: 42000, note: 5,  description: "c'est un marathon", points: [p1,p2])

  # Groups
  g1 = Group.create( name: "Les copains", description: "c'est un groupe entre copain pour aller courrir lol")
  g2 = Group.create( name: "Remi", description: "c'est le groupe de remi sans ami")
  g3 = Group.create( name: "empty group", description: "c'est un groupe vide")


  # Users
  user = User.create(email: 'test@test.com', password: 'password',name: 'name',surname: 'surname',groups: [g1, g2, g3], circuits: [c1,c2,c3])
