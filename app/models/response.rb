class Response < ActiveRecord::Base
  belongs_to :survey
  has_many :questions, through: :survey
  has_many :answers
end
