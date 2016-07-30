class AddNewUserInfo < ActiveRecord::Migration
  def change
    add_column :users, :start_date, :datetime
    add_column :users, :graduation_date, :datetime
    add_column :users, :remaining_mentor_sessions, :integer, default: 8
    add_column :users, :mentor_id, :integer
    add_column :users, :facebook_handle, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :github_handle, :string
    add_column :users, :personal_website, :string
  end
end
