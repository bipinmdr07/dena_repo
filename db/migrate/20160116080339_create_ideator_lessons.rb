class CreateIdeatorLessons < ActiveRecord::Migration
  def change
    create_table :ideator_lessons do |t|

      t.timestamps null: false
    end
  end
end
