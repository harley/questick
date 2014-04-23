class QuestionsController < ApplicationController
  before_action :load_survey, except: [:show, :move]

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

  def show
    @question = Question.find params[:id]
  end

  def destroy
    @question = Question.find params[:id]
    survey = @question.survey
    @question.destroy
    if survey
      redirect_to survey, notice: "Question removed."
    else
      redirect_to root_path, notice: 'Question removed. Return to homepage because no associated survey is found'
    end
  end

  def move
    @question = Question.find params[:id]
    @question.update_attribute :position_position, params[:dir]
    redirect_to :back
  end

  private
    def load_survey
      @survey = Survey.find params[:survey_id]
    end

    def question_params
      params.require(:question).permit(:title, :kind, :position)
    end
end
