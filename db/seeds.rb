# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.create(
  name: "town",
  description: "Town couldn't do anything at night, but could discuss and have the ability to vote and kill one suspicious person after every night."
  )

Character.create(
  name: "mafia",
  description: "Mafia can kill one person per night secretly.",
  ability: "kill",
  ap: 1
  )

Character.create(
  name: "police",
  description: "Police check one person to see if he/she is the mafia per night secretly.",
  ability: "check",
  ap: 2
  )

Character.create(
  name: "doctor",
  description: "Doctor can save one person per night secretly.",
  ability: "heal",
  ap: 3
  )

Character.create(
  name: "escort",
  description: "Escort can block one's ability for the night.",
  ability: "block",
  ap: 4
  )

