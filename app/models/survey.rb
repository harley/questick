require 'csv'
class Survey < ActiveRecord::Base
  validates :title, presence: true
  has_many :questions, -> { order('questions.position ASC') }, dependent: :destroy
  has_many :responses, dependent: :destroy, counter_cache: true

  # TODO handle
  def to_csv(exportable_responses)
    CSV.generate do |csv|
      csv << export_headers

      exportable_responses.each do |r|
        row = [r.id, r.ip, r.referer, r.embedder, r.start_at, r.stop_at, r.email]
        questions.each do |q|
          row.push(*q.export_rows(r))
        end
        csv << row
      end
    end
  end

  def export_headers
    ret = ['id', 'ip', 'referer', 'embedder','start at', 'stop at', 'email']
    questions.each do |question|
      ret.push(*question.export_headers)
    end
    ret
  end

  def to_s
    title
  end

  def passcode_matched?(code)
    passcode.empty? || passcode == code
  end
end
