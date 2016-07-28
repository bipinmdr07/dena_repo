class CreateAlgorithmLessons < ActiveRecord::Migration
  def change
    create_table :algorithm_lessons do |t|

      t.timestamps null: false
    end
  end
end
