# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! username: 'husnulhamidiah', password: 'password', password_confirmation: 'password'
User.create! username: 'husnulanwari', password: 'password', password_confirmation: 'password'
User.create! username: 'lanaya', password: 'password', password_confirmation: 'password'
User.create! username: 'barratum', password: 'password', password_confirmation: 'password'

Doctor.create! user_id: 3, name: 'lanaya', start_at: '08:00'.in_time_zone, end_at: '20:00'.in_time_zone
Doctor.create! user_id: 4, name: 'barratum', start_at: '10:00'.in_time_zone, end_at: '17:00'.in_time_zone

