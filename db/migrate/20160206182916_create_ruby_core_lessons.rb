class CreateRubyCoreLessons < ActiveRecord::Migration
  def change
    create_table :ruby_core_lessons do |t|

      t.timestamps null: false
    end
  end
end
