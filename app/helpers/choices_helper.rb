module ChoicesHelper
  def render_choice(choice, question = nil)
    question ||= choice.question
    render "choices/kind/#{question.kind}", choice: choice
  end
end
