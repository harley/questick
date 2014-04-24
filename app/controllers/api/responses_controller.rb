class Api::ResponsesController < ApplicationController
  respond_to :json

  def show
    @response = Response.find params[:id]
    render json: @response
  end

  # def update
  #   @response = Response.find params[:id]
  #   if @response.update_attributes response_params
  #     render json: [], status: :created
  #   else
  #     render json: @response.errors, status: :unprocessable_entity
  #   end
  # end

  def update_answers
    @response = Response.find params[:id]
    params[:bucket].each do |key, answer_hash|
      answer = Answer.find answer_hash[:id]
      answer.value = answer_hash[:value]
      answer.other = answer_hash[:other]
      answer.save!
    end

    render json: 'Updated', status: 200
  end

  private
    def response_params
      params.require(:response).permit(:answer_bucket)
    end
end
