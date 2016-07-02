class CreateMvcLessons < ActiveRecord::Migration
  def change
    create_table :mvc_lessons do |t|

      t.timestamps null: false
    end
  end
end
