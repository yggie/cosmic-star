class SubmissionsController < ApplicationController

  def index
    @submission = Submission.search(params)

    respond_to do |format|
      format.json { render json: @submission }
    end
  end

  def create
    @person = Person.new(params[:person])
    @answers = params.fetch(:answers, []).map do |ans|
      ans.delete(:doctors)
      Answer.new(ans)
    end

    if Submission.create(person: @person, answers: @answers)
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end
end
