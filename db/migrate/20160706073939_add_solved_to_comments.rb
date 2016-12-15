class AddSolvedToComments < ActiveRecord::Migration
  def change
  	return unless table_exists? :comments
    add_column :comments, :solved, :boolean, default: false
  end
end
