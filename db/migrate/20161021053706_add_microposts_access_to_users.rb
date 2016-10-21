class AddMicropostsAccessToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :microposts_access, :boolean, default: false
  end
end
