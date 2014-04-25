class AddEmbedderToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :embedder, :string
  end
end
