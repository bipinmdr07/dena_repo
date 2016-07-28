class CreateRubyLessons < ActiveRecord::Migration
  def change
    create_table :ruby_lessons do |t|

      t.timestamps null: false
    end
  end
end
