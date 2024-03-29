class ChangeCommentsAndForums < ActiveRecord::Migration
  def change
  	return unless table_exists? :forums
  	remove_column :forums, :chapter
  	remove_column :forums, :lesson
  	add_column :forums, :name, :string
  	add_column :comments, :lesson, :integer
  end
end
