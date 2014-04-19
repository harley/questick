module QuestionsHelper
  def render_question question
    render "questions/kind/#{question.kind}", question: question
  end

  def render_question_choices question
    content_for :div, class: 'question-choices' do
      question.choices.each do |choice|
        render_choice choice
      end
    end
  end
end
