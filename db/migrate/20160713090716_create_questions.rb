class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.string :course_name
      t.integer :lesson_id
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :questions, [:course_name, :lesson_id]
    add_index :questions, :user_id
  end
end
