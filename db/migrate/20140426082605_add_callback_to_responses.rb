class AddCallbackToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :callback, :string
  end
end
