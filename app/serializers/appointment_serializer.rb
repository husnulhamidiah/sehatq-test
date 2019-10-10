class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_at, :end_at
  belongs_to :user
  belongs_to :doctor
end
