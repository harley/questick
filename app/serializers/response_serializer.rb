class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :survey, :questions

  has_many :questions
end
