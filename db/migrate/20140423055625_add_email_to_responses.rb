class AddEmailToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :email, :string
  end
end
