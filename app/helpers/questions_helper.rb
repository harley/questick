module QuestionsHelper
  def render_question question
    render "questions/kind/#{question.kind}", question: question
  end

  def render_question_choices question
    content_for :div, class: 'question-choices form-horizontal' do
      question.choices.each do |choice|
        render_choice(choice)
      end
    end
  end

  def render_question_title question
    if admin?
      safe_join [content_tag(:span, question.kind, class: 'label label-default'), ' ', content_tag(:strong, question.title)]
    else
      content_tag :strong, question.title
    end
  end

  def add_choice_link(question)
    link_to "Add Choice", new_question_choice_path(question), class: 'btn btn-sm btn-default'
  end
end
