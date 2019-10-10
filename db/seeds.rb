require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..8).each do
  user = User.create! name: Faker::Name.unique.name, email: Faker::Internet.unique.email, username: Faker::Alphanumeric.alpha(number: 10), password: 'password', password_confirmation: 'password'
  puts({ id: user.id, email: user.email, password: 'password' })
end

(1..10).each do
  hospital = Hospital.create! name: Faker::Nation.unique.capital_city
  puts({ id: hospital.id, name: hospital.name })
end

doctor = Doctor.create! user_id: 1, hospital_id: 1, start_at: '08:00'.in_time_zone, end_at: '20:00'.in_time_zone
puts({ id: doctor.id, name: doctor.user.name, start_at: doctor.start_at.to_s(:time), end_at: doctor.end_at.to_s(:time) })

doctor = Doctor.create! user_id: 2, hospital_id: 2, start_at: '10:00'.in_time_zone, end_at: '17:00'.in_time_zone
puts({ id: doctor.id, name: doctor.user.name, start_at: doctor.start_at.to_s(:time), end_at: doctor.end_at.to_s(:time) })

doctor = Doctor.create! user_id: 3, hospital_id: 3, start_at: '09:00'.in_time_zone, end_at: '17:00'.in_time_zone
puts({ id: doctor.id, name: doctor.user.name, start_at: doctor.start_at.to_s(:time), end_at: doctor.end_at.to_s(:time) })
