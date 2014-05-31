class Patient
  include MongoMapper::Document

  key :patient_id, String
  key :first_name, String
  key :surname, String
  key :dob, String

  many :submissions

  def self.search(params)
    if params[:first_name]
      @patient = Patient.find_by_first_name(params[:first_name].titleize)
    elsif params[:id]
      @patient = Patient.find_by_patient_id(params[:id])
    else
      return nil
    end
  end
end
