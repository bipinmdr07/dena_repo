class AddUserPermissions < ActiveRecord::Migration
  def change
    add_column :users, :command_line_access, :boolean, default: false
    add_column :users, :rspec_blog_access, :boolean, default: false
    add_column :users, :mvc_access, :boolean, default: false
  end
end
