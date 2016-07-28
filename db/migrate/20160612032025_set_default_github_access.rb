class SetDefaultGithubAccess < ActiveRecord::Migration
  def change
    change_column :users, :github_access, :boolean, default: false
  end
end
