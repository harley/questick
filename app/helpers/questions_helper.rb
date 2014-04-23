module QuestionsHelper
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
