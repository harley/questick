class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :response, index: true
      t.references :choice, index: true
      t.references :question, index: true
      t.text :value

      t.timestamps
    end
  end
end
