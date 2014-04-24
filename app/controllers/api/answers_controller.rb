class Api::AnswersController < ApplicationController
  respond_to :json

  def index
    @response = Response.find params[:response_id]
    render json: @response.answers
  end

  def create
    @answer = Answer.create answer_params

    render json: @answer
  end

  private
    def answer_params
      params.require(:answer).permit(:response_id, :question_id, :choice_id, :value, :other)
    end
end
