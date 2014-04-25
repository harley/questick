class Response < ActiveRecord::Base
  # add more fields as columns to Response when necessary
  HIDDEN_FIELDS = %w(email)

  belongs_to :survey
  has_many :questions, through: :survey
  has_many :answers

  def completed?
    !!stop_at
  end
end
