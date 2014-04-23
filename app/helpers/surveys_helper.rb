module SurveysHelper
  def bc_heading_question(question)
    second = question.new_record? ? 'New question' : link_to(question, question)
    safe_join([link_to(question.survey, question.survey),
               sep,
               second], ' ')
  end

  def bc_heading_choice(choice)
    second = choice.new_record? ? 'New choice' : 'Choice'
    safe_join [bc_heading_question(choice.question), sep, second], ' '
  end

  def sep
    "&#10095;&#10095;".html_safe
  end
end
