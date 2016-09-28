class AddNewLessonColumns < ActiveRecord::Migration
  def change
    add_column :users, :collaboration_access, :boolean, default: false, null: false
    add_column :users, :skill_academy_access, :boolean, default: false, null: false
  end
end
