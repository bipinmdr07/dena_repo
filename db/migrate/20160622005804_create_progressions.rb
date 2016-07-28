class CreateProgressions < ActiveRecord::Migration
  def change
    create_table :progressions do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.string :lesson_name
      t.timestamps null: false
    end
    add_index :progressions, [:user_id, :lesson_id]
    add_index :progressions, :user_id
    add_index :progressions, :lesson_id
  end
end
