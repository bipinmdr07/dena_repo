class AddMentorPostToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :mentor_post, :boolean, default: false
  end
end
