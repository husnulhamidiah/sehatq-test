class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_at, :end_at
  belongs_to :user, serializer: :user
  belongs_to :doctor, serializer: :doctor
end
