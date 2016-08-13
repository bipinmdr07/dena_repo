class AddBootstrapAccess < ActiveRecord::Migration
  def change
    add_column :users, :bootstrap_access, :boolean, default: false
  end
end
