class CreateQuizCategoryRatings < ActiveRecord::Migration
  def change
    unless table_exists?(:quiz_category_ratings)
      create_table :quiz_category_ratings do |t|
        t.integer :user_id
        t.integer :quiz_category_id
        t.float :score
        t.timestamps null: false
      end
      add_index :quiz_category_ratings, :quiz_category_id
      add_index :quiz_category_ratings, :user_id
      add_index :quiz_category_ratings, [:user_id, :quiz_category_id]
      add_index :quiz_category_ratings, :score
    end
  end
end
