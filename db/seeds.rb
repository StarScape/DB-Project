# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DA.create(email: 'foo@appstate.edu', password: 'password', name: 'Foo E. Bar')

Student.create({
    bannerID: '9001',
    fname: 'Jack',
    lname: 'Arrington',
    email: "arringtonja1@appstate.edu"
})

Student.create({
  bannerID: '9002',
  fname: 'Adam',
  lname: 'Harrison',
  email: "adam@appstate.edu"
})

Student.create({
  bannerID: '9003',
  fname: 'Emily',
  lname: 'Eckerson',
  email: "emily@appstate.edu"
})

Student.create({
  bannerID: '9004',
  fname: 'Mary',
  lname: 'Smith',
  email: "mary@appstate.edu"
})

Student.create({
  bannerID: '9005',
  fname: 'Jim',
  lname: 'Jones',
  email: "jim@appstate.edu"
})

buildings = [
  "Appalachian Heights",
  "Appalachian Panhellenic Hall",
  "Belk Hall",
  "Bowie Hall",
  "Cannon Hall",
  "Coltrane Hall",
  "Cone Hall",
  "Doughton Hall",
  "East Hall",
  "Eggers Hall",
  "Frank Hall",
  "Gardner Hall",
  "Hoey Hall",
  "Justice Hall",
  "Living Learning Center",
  "Lovill Hall",
  "Mountaineer Hall",
  "Newland Hall",
  "Summit Hall",
  "White Hall"
]

buildings.each do |b|
  4.times do |f|
    floor = (f + 1)

    20.times do |r|
      room_number = floor * 100 + (r + 1)
      Room.create(number: room_number, building: b)
    end
  end
end

Room.all.each do |room|
  SpareKey.create(room_id: room.id)
  SpareKey.create(room_id: room.id)
end

DA.create(name: "Jordan Fry", email: "fryja@appstate.edu", password: "foobar", password_confirmation: "foobar")