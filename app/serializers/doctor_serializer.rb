class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_at, :end_at
  belongs_to :hospital, serializer: :hospital
end
