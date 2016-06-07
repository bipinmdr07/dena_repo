class AddInstapostAccesstoUsers < ActiveRecord::Migration
  def change
    add_column :users, :instapost_access, :boolean, default: false
  end
end
