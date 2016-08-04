class MakeIndexUnique < ActiveRecord::Migration
  def change
    remove_index :questions, :slug
    add_index :questions, :slug, unique: true
  end
end
