class Question < ActiveRecord::Base
  extend Enumerize

  enumerize :kind, in: [:checkbox, :radio, :dropdown]
  belongs_to :survey
end
