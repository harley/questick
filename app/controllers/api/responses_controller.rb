class Api::ResponsesController < ApplicationController
  respond_to :json

  def show
    @response = Response.find params[:id]
    render json: @response
  end
end
