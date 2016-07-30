class CreateMentorSessions < ActiveRecord::Migration
  def change
    create_table :mentor_sessions do |t|
      t.integer :mentor_id
      t.integer :user_id
      t.text     :private_details
      t.text     :public_details
      t.text     :homework_assigned
      t.datetime :session_date
      t.timestamps null: false
    end
  end
end
