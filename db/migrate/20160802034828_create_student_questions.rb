class CreateStudentQuestions < ActiveRecord::Migration
  def change
    create_table :student_questions do |t|
      t.integer :user_id
      t.string :title
      t.text :answer
      t.timestamps null: false
    end
    add_index :student_questions, :user_id
  end
end
