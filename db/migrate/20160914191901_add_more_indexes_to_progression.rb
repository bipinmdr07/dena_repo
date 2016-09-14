class AddMoreIndexesToProgression < ActiveRecord::Migration
  def change
    add_index :progressions, [:user_id, :lesson_id, :course_name]
    add_index :progressions, :lesson_id
    remove_index :progressions, [:user_id, :course_name]
  end
end
