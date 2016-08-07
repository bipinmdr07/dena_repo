class ChangeColumnRubyFundamentalsToRuby < ActiveRecord::Migration
  def change
    rename_column :users, :ruby_fundamentals_access, :ruby_access
  end
end
