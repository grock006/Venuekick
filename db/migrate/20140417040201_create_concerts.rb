class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :name
      t.string :venue
      t.string :time
      t.string :uri
      t.string :user_id

      t.timestamps
    end
  end
end
