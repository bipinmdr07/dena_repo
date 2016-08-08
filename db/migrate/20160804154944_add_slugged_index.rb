class AddSluggedIndex < ActiveRecord::Migration
  def change
    add_index :questions, :slug
  end
end
