class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :overview
      t.string :facebook_link
      t.datetime :datetime
      t.string :venue
      t.string :title
      t.timestamps null: false
    end
  end
end
