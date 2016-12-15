class AddApprovedToSubmissions < ActiveRecord::Migration
  def change
  	return unless table_exists? :submission_comments
    add_column :submission_comments, :approved, :boolean, default: false
  end
end
