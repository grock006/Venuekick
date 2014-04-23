class RemoveUseridColumn < ActiveRecord::Migration
  def change
  	remove_column :concerts, :user_id
  end
end
