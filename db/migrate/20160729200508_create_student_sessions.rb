class CreateStudentSessions < ActiveRecord::Migration
  def change
    create_table :student_sessions do |t|
      t.integer  :user_id
      t.integer  :mentor_id
      t.text     :public_details
      t.text     :private_details
      t.text     :motivation_level
      t.integer :mentor_session_id
      t.timestamps null: false
    end
  end
end
