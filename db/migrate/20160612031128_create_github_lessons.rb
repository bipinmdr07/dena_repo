class CreateGithubLessons < ActiveRecord::Migration
  def change
    create_table :github_lessons do |t|

      t.timestamps null: false
    end
  end
end
