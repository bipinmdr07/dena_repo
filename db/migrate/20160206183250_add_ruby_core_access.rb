class AddRubyCoreAccess < ActiveRecord::Migration
  def change
    add_column :users, :ruby_core_access, :boolean, default: false
  end
end
