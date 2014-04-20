class Api::AnswersController < ApplicationController
  respond_to :json

  def show
    @reponse = Response.find params[:response_id]
    render json: @response.answers
  end
end
