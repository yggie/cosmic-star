class Patient
  include MongoMapper::Document

  key :patient_id, String
  key :first_name, String
end
