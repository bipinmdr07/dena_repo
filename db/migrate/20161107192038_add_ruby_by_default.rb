class AddRubyByDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :ruby_access, :boolean, default: true
  end
end
