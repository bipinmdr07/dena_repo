class AddPreworkEndDate < ActiveRecord::Migration
  def change
    add_column :users, :prework_end_date, :datetime
  end
end
