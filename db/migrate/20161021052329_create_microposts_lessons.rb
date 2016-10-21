class CreateMicropostsLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts_lessons do |t|

      t.timestamps
    end
  end
end
