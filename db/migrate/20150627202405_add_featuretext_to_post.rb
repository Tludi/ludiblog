class AddFeaturetextToPost < ActiveRecord::Migration
  def change
    add_column :posts, :featuretext, :string
  end
end
