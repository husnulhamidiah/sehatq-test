class User < ApplicationRecord
  has_secure_password

  has_many :appointments
  has_many :doctors, through: :appointments
  has_one :doctor

  validates_presence_of :username, :email, :password_digest, :name
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
