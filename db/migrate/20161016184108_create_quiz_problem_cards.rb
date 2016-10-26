class CreateQuizProblemCards < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_problem_cards do |t|
      t.references :user, foreign_key: true
      t.references :quiz_problem, foreign_key: true
      t.float :prev_ef, default: 2.5
      t.float :prev_interval, default: 0.0
      t.float :quality_response
      t.float :calculated_interval
      t.float :calculated_ef
      t.datetime :repetition_date

      t.timestamps
    end
  end
end
