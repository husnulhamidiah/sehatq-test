class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  belongs_to :user

  # validations
  validates_presence_of :name, :start_at, :end_at
end
