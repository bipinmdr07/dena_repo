class AddFilmsterAccessToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :filmster_access, :boolean, default: false, null: false 
  end
end
