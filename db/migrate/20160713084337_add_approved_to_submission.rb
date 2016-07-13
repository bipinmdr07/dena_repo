class AddApprovedToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :approved, :boolean, default: false
  end
end
