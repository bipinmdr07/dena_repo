class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.boolean :master, default: false, null: false
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :decks, :user_id
    add_index :decks, :master
    add_column :cards, :master, :boolean, default: false, null: false
    add_index :cards, :master
  end
end
