class CreateJavascriptLessons < ActiveRecord::Migration
  def change
    create_table :javascript_lessons do |t|

      t.timestamps null: false
    end
  end
end
