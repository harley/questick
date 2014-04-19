class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :survey, index: true
      t.string :ip
      t.string :referer

      t.timestamps
    end
  end
end
