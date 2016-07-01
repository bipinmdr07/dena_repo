class ChangeUserDefaults < ActiveRecord::Migration
  def change
    change_column :users, :ruby_fundamentals_access, :boolean, default: false
  end
end
