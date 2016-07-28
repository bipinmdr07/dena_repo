class CreateRspecBlogLessons < ActiveRecord::Migration
  def change
    create_table :rspec_blog_lessons do |t|

      t.timestamps null: false
    end
  end
end
