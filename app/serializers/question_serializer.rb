class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :kind, :choices
end
