class CreateComments < ActiveRecord::Migration
  def change
    drop_table :comments
    create_table :comments do |t|
      t.integer :user_id
      t.integer :student_question_id
      t.text :content
      t.timestamps null: false
    end
    add_index :comments, :user_id
    add_index :comments, :student_question_id
    add_index :comments, [:user_id, :student_question_id]
  end
end
