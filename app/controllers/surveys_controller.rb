class SurveysController < ApplicationController
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
      redirect_to @survey, notice: 'Created a survey. Make it great!'
    else
      render :new
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

  private
    def survey_params
      params.require(:survey).permit(:title, :passcode)
    end
end
