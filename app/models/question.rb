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

  def export_headers
    case kind
    when "radio"
      [title]
    else
      choices.map{|c| "#{title} :: #{c.text}"}
    end
  end

  def export_rows(response)
    row = []
    case kind
    when "radio"
      answers = Answer.where(question_id: self.id, response_id: response.id)
      row << answers.map(&:exported_value).select(&:present?).join(',')
    else
      # one column per choice
      choices.each do |choice|
        answers = Answer.where(question_id: self.id, response_id: response.id, choice_id: choice.id)
        row << answers.map(&:exported_value).join(',')
      end
    end
    row
  end
end
