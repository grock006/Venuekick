class ChangeColumnUsingCast < ActiveRecord::Migration
  def change
  	add_column :concerts, :save_id, :integer
  end
end
