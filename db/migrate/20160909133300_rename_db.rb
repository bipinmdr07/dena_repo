class RenameDb < ActiveRecord::Migration
  def change
    rename_column :users, :ruby_acesss, :ruby_access
  end
end
