class AddNullFalseToCorrect < ActiveRecord::Migration[5.0]
  def change
    change_column :quiz_options, :correct, :boolean, null: false
  end
end
