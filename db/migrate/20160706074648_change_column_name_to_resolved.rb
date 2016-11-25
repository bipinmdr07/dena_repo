class ChangeColumnNameToResolved < ActiveRecord::Migration
  def change
  	return unless table_exists? :comments
    rename_column :comments, :solved, :resolved
  end
end
