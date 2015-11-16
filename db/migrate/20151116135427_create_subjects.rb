class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      
      t.string :room_id
      t.string :subject_name
      t.string :subject_time
      t.string :day
      
      t.timestamps null: false
    end
  end
end
