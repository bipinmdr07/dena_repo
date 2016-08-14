class CreateBootstrapLessons < ActiveRecord::Migration
  def change
    create_table :bootstrap_lessons do |t|

      t.timestamps null: false
    end
  end
end
