class AddEmbedToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :embed, :boolean
  end
end
