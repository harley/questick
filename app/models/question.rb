class Question < ActiveRecord::Base
  include RankedModel

  ranks :position, with_same: :survey_id
  extend Enumerize

  enumerize :kind, in: [:checkbox, :radio, :text]
  belongs_to :survey
  has_many :choices, -> { order('choices.position ASC') }, dependent: :destroy

  validates :kind, presence: true

  def to_s
    title
  end
end
