class ChangeDescriptionToContent < ActiveRecord::Migration
  def change
    rename_column :submissions, :description, :content
    rename_column :questions, :description, :content
  end
end
