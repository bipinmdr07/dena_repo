class ChangeIdeatorToTwitr < ActiveRecord::Migration
  def change
    rename_column :users, :ideator_access, :twitr_access
  end
end
