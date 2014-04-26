class ResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])

    # only one response per email
    if params[:email].present?
      @response = @survey.responses.where(email: params[:email]).last

      if @response.try(:completed?)
        redirect_to thankyou_response_path(@response) and return
      end
    end

    @response ||= @survey.responses.build
    @response.email ||= params[:email]

    @response.ip = request.remote_ip
    @response.start_at = Time.now

    @response.embed = params[:embed]
    if params.has_key?(:referer)
      @response.embedder = request.referer
      @response.referer = params[:referer]
    else
      @response.referer = request.referer
    end
    @response.callback = params[:callback]

    # Response::HIDDEN_FIELDS.each do |field|
    #   @response.send("#{field}=", params[field])
    # end

    @response.save!
    redirect_to edit_response_path(@response)
  end

  def edit
    @response = Response.find params[:id]
    render layout: 'plain'
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
    @response = Response.find params[:id]
    if @response.completed?
      render layout: 'plain'
    else
      redirect_to edit_response_path(@response)
    end
  end
end
