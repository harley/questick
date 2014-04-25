class Answer < ActiveRecord::Base
  belongs_to :response
  belongs_to :choice
  belongs_to :question

  validates :choice_id, presence: true
  validates :response_id, presence: true

  def hashed_id
    "a-#{response.id}-#{choice.id}"
  end

  def exported_value
    if other.present?
      "#{value} :: #{other}"
    else
      value
    end
  end
end
