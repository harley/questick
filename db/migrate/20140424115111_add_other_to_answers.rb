class AddOtherToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :other, :string
  end
end
