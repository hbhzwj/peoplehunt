class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :nickname
      t.string :name
      t.string :location
      t.datetime :event_time
      t.string :status
      t.boolean :is_complete

      t.timestamps
    end
  end
end
