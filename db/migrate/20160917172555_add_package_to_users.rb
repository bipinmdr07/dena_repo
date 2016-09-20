class AddPackageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :package, :integer
  end
end
