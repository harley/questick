class SurveysController < ApplicationController
  def index
    # TODO: admin only
    @surveys = Survey.all
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
  end

  private
    def survey_params
      params.require(:survey).permit(:title, :passcode)
    end
end
