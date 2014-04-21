class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :survey, :questions, :answer_bucket

  has_many :questions

  def answer_bucket
    ret = {}
    object.questions.each do |q|
      q.choices.each do |c|
        a = Answer.where(response_id: object.id, question_id: q.id, choice_id: c.id).first_or_create
        ret[a.hashed_id] = AnswerSerializer.new(a)
      end
    end
    ret
  end
end
