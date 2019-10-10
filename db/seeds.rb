# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! username: 'husnulhamidiah', password: 'password', password_confirmation: 'password', name: 'husnul hamidiah', email: 'husnulhamidiah@gmail.com'
User.create! username: 'husnulanwari', password: 'password', password_confirmation: 'password', name: 'husnul anwari', email: 'husnulanwari@gmail.com'
User.create! username: 'lanaya', password: 'password', password_confirmation: 'password', name: 'templar assasin', email: 'lanaya@gmail.com'
User.create! username: 'barratum', password: 'password', password_confirmation: 'password', name: 'spirit breaker', email: 'barratum@gmail.com'

Hospital.create! name: 'rosh pit rs'
Hospital.create! name: 'secret shop rs'

Doctor.create! user_id: 3, hospital_id: 1, start_at: '08:00'.in_time_zone, end_at: '20:00'.in_time_zone
Doctor.create! user_id: 4, hospital_id: 2, start_at: '10:00'.in_time_zone, end_at: '17:00'.in_time_zone


