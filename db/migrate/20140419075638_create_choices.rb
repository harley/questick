class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question, index: true
      t.text :text
      t.integer :position

      t.timestamps
    end
  end
end
