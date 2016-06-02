class CreateInstapostLessons < ActiveRecord::Migration
  def change
    create_table :instapost_lessons do |t|

      t.timestamps null: false
    end
  end
end
