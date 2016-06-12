class AddJavascriptAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :javascript_access, :boolean, default: false
  end
end
