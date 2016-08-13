class AddArchivedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :archived, :boolean, default: false
    add_index :cards, [:archived, :user_id]
  end
end
