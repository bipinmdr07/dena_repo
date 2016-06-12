class AddGithubAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_access, :boolean
  end
end
