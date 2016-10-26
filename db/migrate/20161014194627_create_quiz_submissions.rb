class CreateQuizSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_submissions do |t|
      t.references :user
      t.references :quiz_problem

      t.timestamps
    end
    add_index :quiz_submissions, [:user_id, :quiz_problem_id]
    add_foreign_key :quiz_submissions, :users
    add_foreign_key :quiz_submissions, :quiz_problems
  end
end
