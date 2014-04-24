module SurveysHelper
  def bc_heading_question(question)
    second = question.new_record? ? 'New question' : link_to(question, question)
    safe_join([survey_link_bypass(question.survey),
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

  def survey_link(survey)
    link_to survey.title, survey_path(survey, passcode: params[:passcode])
  end

  def survey_link_bypass(survey)
    link_to survey.title, survey_path(survey, passcode: survey.passcode)
  end
end
