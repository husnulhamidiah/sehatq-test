class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  # validations
  validates_presence_of :username, :password
end
