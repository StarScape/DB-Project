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