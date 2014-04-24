class AnswerSerializer < ActiveModel::Serializer
  self.root = false

  embed :ids

  attributes :id, :value, :other
  has_one :response
  has_one :choice
  has_one :question
end
