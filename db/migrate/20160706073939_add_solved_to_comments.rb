class AddSolvedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :solved, :boolean, default: false
  end
end
