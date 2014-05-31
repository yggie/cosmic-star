class SubmissionsController < ApplicationController

  def index
    @submission = Submission.search(params)

    respond_to do |format|
      format.json do
        if @submission
          render json: @submission.as_json(
            include: {
              person: {},
              answers: {
                include: :doctors
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

    if Submission.create(person: @person, answers: @answers)
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end
end
