class SurveysController < ApplicationController
  before_action :passcode_required, only: [:show, :edit]

  def index
    if params[:d] == 'supersecret'
      # TODO: admin only
      @surveys = Survey.all
    elsif params[:passcode]
      @surveys = Survey.where(passcode: params[:passcode])
    else
      flash.now[:notice] = "Showing surveys without a passcode."
      @surveys = Survey.where(passcode: nil)
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to survey_path(@survey, passcode: @survey.passcode), notice: 'Created a survey. Make it great!'
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find params[:id]
  end

  def update
    @survey = Survey.find params[:id]
    if @survey.update_attributes survey_params
      redirect_to survey_path(@survey, passcode: @survey.passcode), notice: 'Survey updated.'
    else
      render 'edit'
    end
  end

  def show
    @survey = Survey.find params[:id]

    respond_to do |format|
      format.html
      format.csv { send_data @survey.to_csv(@survey.responses) }
      format.text { render text: @survey.to_csv(@survey.responses) }
    end
  end

  def passcode_please
    @survey = Survey.find params[:id]
    @url = params[:from] || survey_path(@survey)
  end

  private
    def survey_params
      params.require(:survey).permit(:title, :passcode)
    end

    def passcode_required
      @survey = Survey.find params[:id]

      unless @survey.passcode_matched?(params[:passcode])
        redirect_to passcode_please_survey_path(@survey, from: request.fullpath)
      end
    end
end
