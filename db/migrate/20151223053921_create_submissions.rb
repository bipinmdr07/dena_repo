class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
