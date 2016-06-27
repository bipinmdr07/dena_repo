class AddLessonUrlToCards < ActiveRecord::Migration
  def change
    add_column :cards, :lesson_url, :string
  end
end
