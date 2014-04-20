class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :value
  has_one :response
  has_one :choice
  has_one :question
end
