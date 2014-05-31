class AnswersController < ApplicationController

  def index
    @answers = Answer.search(params)

    respond_to do |format|
      format.json { render json: @answers }
    end
  end
end
