class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  belongs_to :user
  belongs_to :hospital

  # validations
  validates_presence_of :hospital_id, :start_at, :end_at
  validates :user_id, uniqueness: true
end
