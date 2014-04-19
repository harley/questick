class QuestionsController < ApplicationController
  before_action :load_survey

  def new
    @question = @survey.questions.new
  end

  def create
    @question = @survey.questions.build question_params
    if @question.save
      redirect_to @survey, notice: 'Question added.'
    else
      render 'new'
    end
  end
  private
    def load_survey
      @survey = Survey.find params[:survey_id]
    end

    def question_params
      params.require(:question).permit(:title, :kind)
    end
end
