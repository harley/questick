class Choice < ActiveRecord::Base
  include RankedModel
  ranks :position, with_same: :question_id

  belongs_to :question
end
