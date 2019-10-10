class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  belongs_to :user
  belongs_to :hospital

  # validations
  validates_presence_of :name, :hospital_id, :start_at, :end_at
end
