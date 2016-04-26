  # clean db
  Point.delete_all
  User.delete_all
  Group.delete_all
  Circuit.delete_all
  Api_token.delete_all

  # Points
  p1 = Point.create(latitude: 1, longitude: 1)
  p2 = Point.create(latitude: 6, longitude: 2)
  p3 = Point.create(latitude: 7, longitude: 3)
  p4 = Point.create(latitude: 8, longitude: 4)

  # Circuits
  c1 = Circuit.create(distance: 2000, note: 4,  description: "c'est dur lol", points: [p1,p2])
  c2 = Circuit.create(distance: 50, note: 4,  description: "easy", points: [p1,p2])
  c3 = Circuit.create(distance: 42000, note: 5,  description: "c'est un marathon", points: [p1,p2])

  # Users
  user = User.create(email: 'test@test.com', password: 'password',name: 'default_name',surname: 'default_surname', circuits: [c1,c2,c3])
  user = User.create(email: 'test1@test.com', password: 'password',name: 'default_name',surname: 'default_surname', circuits: [c1,c2,c3])

  # # Groups
  g1 = Group.create( name: "Les copains", description: "c'est un groupe entre copain pour aller courrir lol", admin: user)
  g2 = Group.create( name: "Remi", description: "c'est le groupe de remi sans ami", admin: user)
  g3 = Group.create( name: "empty group", description: "c'est un groupe vide", admin: user)

  # api key
  Api_token.create(api: "ember", iteration: "0", token: "change_me_at_prod1")
  Api_token.create(api: "angular", iteration: "0", token: "change_me_at_prod2")