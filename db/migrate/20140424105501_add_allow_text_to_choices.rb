class AddAllowTextToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :allow_text, :boolean, default: false
  end
end
