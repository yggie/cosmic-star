class Doctor
  include MongoMapper::Document

  key :name, String
  key :type, String

  belongs_to :answer
end
