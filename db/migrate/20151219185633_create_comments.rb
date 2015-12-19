class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :forum_id
    	t.string :title
    	t.text :description
      t.timestamps null: false
    end
    add_index :comments, :forum_id
    add_index :forums, [:chapter, :lesson]
  end
end
