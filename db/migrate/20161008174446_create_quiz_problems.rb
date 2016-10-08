class CreateQuizProblems < ActiveRecord::Migration
  def change
    create_table :quiz_problems do |t|
      t.integer :lesson_id
      t.string :course_name
      t.string :question
      t.timestamps null: false
    end
    add_index :quiz_problems, [:course_name, :lesson_id]
  end
end
