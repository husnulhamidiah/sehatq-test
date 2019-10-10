class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_at, :end_at
end
