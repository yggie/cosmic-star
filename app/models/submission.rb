class Submission
  include MongoMapper::Document

  one :person
  many :answers
  timestamps!

  def self.search(params)
    @id = params[:id] || Patient.find_by_first_name(params[:first_name]).try(:patient_id)

    Person.find_by_patient_id(@id).try(:submission)
  end
end
