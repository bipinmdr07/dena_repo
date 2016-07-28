class ChangeColumnNameToResolved < ActiveRecord::Migration
  def change
    rename_column :comments, :solved, :resolved
  end
end
