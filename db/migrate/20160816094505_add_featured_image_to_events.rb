class AddFeaturedImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :featured_image, :string
  end
end
