class AddFontIconAndPostImageUrlToPost < ActiveRecord::Migration
  def change
    add_column :posts, :fonticon, :string
    add_column :posts, :postimageurl, :string
  end
end
