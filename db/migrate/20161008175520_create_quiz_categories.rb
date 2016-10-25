class CreateQuizCategories < ActiveRecord::Migration
  def change
    unless table_exists?(:quiz_categories)
      create_table :quiz_categories do |t|
        t.string :name
        t.integer :lesson_id
        t.string :course_name
        t.timestamps null: false
      end
      add_index :quiz_categories, :lesson_id
    end
  end
end
