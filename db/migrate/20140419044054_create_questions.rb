class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :position
      t.references :survey, index: true
      t.string :kind
      t.text :title

      t.timestamps
    end
  end
end
