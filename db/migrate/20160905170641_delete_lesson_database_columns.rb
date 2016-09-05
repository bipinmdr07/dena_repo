class DeleteLessonDatabaseColumns < ActiveRecord::Migration
  def change
    drop_table :algorithm_lessons
    drop_table :bootstrap_lessons
    drop_table :command_line_lessons
    drop_table :github_lessons
    drop_table :html_css_lessons
    drop_table :ideator_lessons
    drop_table :instapost_lessons
    drop_table :intro_lessons
    drop_table :javascript_lessons
    drop_table :mvc_lessons
    drop_table :rspec_blog_lessons
    drop_table :ruby_core_lessons
    drop_table :ruby_lessons
  end
end
