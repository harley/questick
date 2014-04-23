class Question < ActiveRecord::Base
  include RankedModel

  ranks :position, with_same: :survey_id
  extend Enumerize

  enumerize :kind, in: [:checkbox, :radio, :dropdown]
  belongs_to :survey
  has_many :choices, -> { order('position') }, dependent: :destroy

  validates :kind, presence: true
end
