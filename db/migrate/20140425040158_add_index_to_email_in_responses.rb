class AddIndexToEmailInResponses < ActiveRecord::Migration
  def change
    add_index :responses, :email
  end
end
