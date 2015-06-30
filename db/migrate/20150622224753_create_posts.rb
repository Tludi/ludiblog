class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :featuretext
      t.integer :category_id
      t.integer :user_id
      t.integer :status
      t.string :fonticon
      t.string :postimageurl
      t.integer :featured

      t.timestamps null: false
    end
  end
end
