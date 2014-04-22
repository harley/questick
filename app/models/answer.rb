class Answer < ActiveRecord::Base
  belongs_to :response
  belongs_to :choice
  belongs_to :question

  def hashed_id
    "a-#{response.id}-#{choice.id}"
  end

  def quoted_value
    if value && value.include?(',')
      %{"#{value}"}
    else
      value
    end
  end
end
