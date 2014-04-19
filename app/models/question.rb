class Question < ActiveRecord::Base
  extend Enumerize

  enumerize :kind, in: [:check_box, :radio, :dropdown]
  belongs_to :survey
  has_many :choices

  validates :kind, presence: true
end
