class CreateCommandLineLessons < ActiveRecord::Migration
  def change
    create_table :command_line_lessons do |t|

      t.timestamps null: false
    end
  end
end
