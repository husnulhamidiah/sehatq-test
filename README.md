# SehatQ Assessment

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://forthebadge.com)

## Installation

```
git clone https://github.com/husnulhamidiah/sehatq-test

bundle install

bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rspec
bundle exec rails s
```

## Documentation

<details>
  <summary>Get all hospitals</summary>

  ```
  curl -X GET \
    http://localhost:3000/hospitals \
    -H 'Accept: */*'
  ```
</details>

<details>
  <summary>Get all doctors</summary>

  ```
  curl -X GET \
    http://localhost:3000/doctors \
    -H 'Accept: */*'
  ```
</details>

<details>
  <summary>Create a new user</summary>
  
  ```
  curl -X POST \
    http://localhost:3000/users/signup \
    -H 'Accept: */*' \
    -H 'Content-Type: application/json' \
    -d '{
    "name": "husnul hamidiah",
    "email": "husnul1990@gmail.com",
    "username": "husnul1990",
    "password": "password",
    "password_confirmation": "password"
  }'
  ```
</details>

<details>
  <summary>Create a new doctor</summary>
  
  ```
  curl -X POST \
    http://localhost:3000/doctors/signup \
    -H 'Accept: */*' \
    -H 'Content-Type: application/json' \
    -d '{
    "name": "husnul hamidiah",
    "email": "husnul1991@gmail.com",
    "username": "husnul1991",
    "password": "password",
    "password_confirmation": "password",
    "start_at": "08:00",
    "end_at": "19:00",
    "hospital_id": "1"
  }'
  ```
</details>

<details>
  <summary>Authentication</summary>
  
  ```
  curl -X POST \
    http://localhost:3000/auth/login \
    -H 'Accept: */*' \
    -H 'Content-Type: application/json' \
    -d '{
    "email": "husnul1991@gmail.com",
    "password": "password"
  }'
  ```
</details>

<details>
  <summary>Create an appointment</summary>
  
  ```
  curl -X POST \
    http://localhost:3000/appointments \
    -H 'Accept: */*' \
    -H 'Authorization: Bearer TOKEN_FROM_AUTHENTICATION' \
    -H 'Content-Type: application/json' \
    -d '{
    "user_id": 11,
    "doctor_id": 4,
    "start_at": "2019-10-14 09:00:00",
    "end_at": "2019-10-14 10:00:00"
  }'
  ```
</details>

<details>
  <summary>Get doctor's appointments</summary>
  
  ```
  curl -X GET \
    http://localhost:3000/doctors/4/appointments \
    -H 'Accept: */*' \
    -H 'Authorization: Bearer TOKEN_FROM_AUTHENTICATION' \
    -H 'Content-Type: application/json'
  ```
</details>

<details>
  <summary>Get user's appointments</summary>
  
  ```
  curl -X GET \
    http://localhost:3000/users/4/appointments \
    -H 'Accept: */*' \
    -H 'Authorization: Bearer TOKEN_FROM_AUTHENTICATION' \
    -H 'Content-Type: application/json'
  ```
</details>


