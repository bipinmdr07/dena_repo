class AddApplicationReasonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :application_reasons, :text
  end
end
