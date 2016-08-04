class AddAdmittedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admitted, :boolean, default: false
    add_index :users, :admitted
  end
end
