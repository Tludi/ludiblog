class ChangeStatusFromStringToInteger < ActiveRecord::Migration
  def change
    change_column :posts, :status, :integer
  end
end
