class ChoicesController < ApplicationController
  before_action :load_question, except: [:move, :toggle_allow_text]

  def new
    @choice = @question.choices.new
  end

  def create
    @choice = @question.choices.build choice_params
    if @choice.save
      redirect_to @question, notice: 'Choice added.'
    else
      render 'new'
    end
  end

  def destroy
    @choice = @question.choices.find params[:id]
    @choice.destroy
    redirect_to :back
  end

  def move
    @choice = Choice.find params[:id]
    @choice.update_attribute :position_position, params[:dir]
    redirect_to :back
  end

  def toggle_allow_text
    @choice = Choice.find params[:id]
    @choice.update_column :allow_text, !@choice.allow_text?
    redirect_to :back
  end

  private
    def load_question
      @question = Question.find params[:question_id]
    end

    def choice_params
      params.require(:choice).permit(:text, :position)
    end
end
