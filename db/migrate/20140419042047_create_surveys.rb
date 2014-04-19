class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :token
      t.string :passcode

      t.timestamps
    end
  end
end
