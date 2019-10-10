class User < ApplicationRecord
  has_secure_password

  has_many :appointments
  has_many :doctors, through: :appointments
  has_one :doctor

  # validations
  validates_presence_of :username, :password_digest, :name
end
