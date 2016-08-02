class AddPreWorkStart < ActiveRecord::Migration
  def change
    add_column :users, :prework_start_time, :datetime
  end
end
