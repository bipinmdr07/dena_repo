class AddAlgorithmAccessToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :algorithm_access, :boolean, default: false, null: false
  end
end
