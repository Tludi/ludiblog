class AddFonticonToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :fonticon, :string
  end
end
