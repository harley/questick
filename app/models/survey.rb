class Survey < ActiveRecord::Base
  validates :title, presence: true
  has_many :questions, dependent: :destroy
  has_many :responses
end
