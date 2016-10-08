class CreateQuizOptions < ActiveRecord::Migration
  def change
    create_table :quiz_options do |t|
      t.integer :quiz_problem_id
      t.string :content
      t.boolean :correct
      t.timestamps null: false
    end
    add_index :quiz_options, :quiz_problem_id
    add_foreign_key :quiz_options, :quiz_problems
  end
end
