class ResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build
    @response.ip = request.remote_ip
    @response.referer = request.referer
    @response.embed = params[:embed]
    @response.start_at = Time.now
    Response::HIDDEN_FIELDS.each do |field|
      @response.send("#{field}=", params[field])
    end
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
    if @response.save
      redirect_to thankyou_response_path(@response)
    else
      logger.error "[Error] Can't save response #{@response.inspect}"
    end
  end

  def thankyou
    render layout: 'angular'
  end
end
