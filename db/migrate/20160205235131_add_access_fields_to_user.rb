class AddAccessFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :intro_access, :boolean, default: true
    add_column :users, :html_css_access, :boolean, default: true
    add_column :users, :ruby_fundamentals_access, :boolean, default: true
    add_column :users, :ideator_access, :boolean, default: false
  end
end
