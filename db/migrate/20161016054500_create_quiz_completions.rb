class CreateQuizCompletions < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_completions do |t|
      t.integer :lesson_id
      t.string :course_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
