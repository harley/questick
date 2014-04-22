class AddTimestampToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :start_at, :datetime
    add_column :responses, :stop_at, :datetime
  end
end
