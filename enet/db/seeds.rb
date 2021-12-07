# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UniversityModule.create(  module_leader: 'Andrew Crossan', name: 'Web Applications Development', identifier: 'com2025')
UniversityModule.create( module_leader: 'Steve Schneider', name: 'Advanced Algorithms', identifier: 'com2031')
UniversityModule.create( module_leader: 'Roman Bauer', name: 'Information Retrieval', identifier: 'com2034')
UniversityModule.create( module_leader: 'Santanu Dash', name: 'Further Programming Paradigms', identifier: 'com2040')

User.create(email: 'admin', password: 'password', password_confirmation: 'password')