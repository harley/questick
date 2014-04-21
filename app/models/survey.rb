require 'csv'
class Survey < ActiveRecord::Base
  validates :title, presence: true
  has_many :questions, dependent: :destroy
  has_many :responses

  # TODO handle
  def to_csv(exportable_responses)
    CSV.generate do |csv|
      csv << export_headers

      exportable_responses.each do |r|
        row = [r.id, r.ip, r.referer]
        questions.each do |q|
          answers = Answer.where(question_id: q.id, response_id: r.id)
          row << answers.select{|a| a.value.present?}.map(&:value).join(', ')
        end
        csv << row
      end
    end
  end

  def export_headers
    ret = ['id', 'ip', 'referer']
    questions.each do |question|
      ret << question.title
    end
    ret
  end
end
