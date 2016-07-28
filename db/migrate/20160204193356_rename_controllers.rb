class RenameControllers < ActiveRecord::Migration
  def change
    rename_table :html_csses, :html_css_lessons
    rename_table :intros, :intro_lessons
  end
end
