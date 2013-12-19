class AddFImageToFPost < ActiveRecord::Migration
  def change
    add_column :f_posts, :f_image, :string
  end
end
