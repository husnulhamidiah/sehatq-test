class HospitalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :doctors, serializer: :doctor
end
