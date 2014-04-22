class ChangeConcertUseridToInteger < ActiveRecord::Migration
  def up
  	change_column :concerts, :user_id, :integer
  end

  def down
  	change_column :concerts, :user_id, :string
  end
end
