class Response < ActiveRecord::Base
  belongs_to :survey
  has_many :questions, through: :survey
end