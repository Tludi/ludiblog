class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :category_id
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
