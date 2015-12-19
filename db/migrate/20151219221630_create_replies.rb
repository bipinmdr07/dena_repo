class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.integer :user_id
    	t.integer :comment_id
    	t.string :content
      t.timestamps null: false
    end
    add_index :replies, [:user_id, :comment_id]
  end
end
