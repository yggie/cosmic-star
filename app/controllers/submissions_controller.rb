class SubmissionsController < ApplicationController

  def index
    @patient = Patient.search(params)

    respond_to do |format|
      format.json do
        if @patient
          render json: @patient.as_json(
            include: {
              submissions: {
                include: {
                  person: {},
                  answers: {
                    include: :doctors
                  }
                }
              }
            }
          )
        else
          render nothing: true, status: 400
        end
      end
    end
  end

  def create
    @person = Person.new(params.fetch(:person, {}))
    @answers = params.fetch(:answers, []).map do |ans|
      if ans[:doctors]
        ans[:doctors] = ans[:doctors].map { |hash| Doctor.new(hash) }
      else
        ans.delete(:doctors)
      end
      Answer.new(ans)
    end

    @patient = Patient.find_by_patient_id(@person.patient_id)

    unless @patient
      render nothing: true, status: 400
      return
    end
    @patient.submissions.each(&:destroy)

    @submission = @patient.submissions.create(person: @person, answers: @answers)
    if @submission
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end
end
