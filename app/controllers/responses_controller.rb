class ResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build
    @response.ip = request.remote_ip
    @response.referer = request.referer
    @response.embed = params[:embed]
    @response.start_at = Time.now
    @response.save!

    redirect_to edit_response_path(@response)
  end

  def edit
    @response = Response.find params[:id]
    render layout: 'angular'
  end

  def update
    @response = Response.find params[:id]
    @response.stop_at = Time.now
    @response.save
    render text: 'Thank you. Your response has been saved'
  end
end
