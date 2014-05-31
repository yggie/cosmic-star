class Submission
  include MongoMapper::Document

  one :person
  many :answers
  timestamps!

  belongs_to :patient
end
