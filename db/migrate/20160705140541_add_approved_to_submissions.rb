class AddApprovedToSubmissions < ActiveRecord::Migration
  def change
    add_column :submission_comments, :approved, :boolean, default: false
  end
end
