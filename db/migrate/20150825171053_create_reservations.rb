class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      
      t.string :building
      t.integer :room_id
      t.string :user
      t.string :department
      t.string :professor
      t.date :date
      t.datetime :start_time
      t.datetime :finish_time
      t.string :purpose
      t.string :state
      t.integer :accept_people
            
      t.timestamps null: false
    end
  end
end
