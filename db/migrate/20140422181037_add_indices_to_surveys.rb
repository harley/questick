class AddIndicesToSurveys < ActiveRecord::Migration
  def change
    add_index :surveys, :token
    add_index :surveys, :passcode
  end
end
