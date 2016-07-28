class CreateHtmlCsses < ActiveRecord::Migration
  def change
    create_table :html_csses do |t|

      t.timestamps null: false
    end
  end
end
