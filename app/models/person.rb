class Person
  include MongoMapper::Document

  key :patient_id, String
  key :type, String
  key :first_name, String
  key :last_name, String

  belongs_to :submission
end
