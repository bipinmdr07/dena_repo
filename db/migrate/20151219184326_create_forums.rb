class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :chapter
      t.integer :lesson
      t.timestamps null: false
    end
  end
end
