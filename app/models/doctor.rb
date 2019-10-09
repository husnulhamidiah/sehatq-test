class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  # validations
  validates_presence_of :name, :start_date, :end_date
end
