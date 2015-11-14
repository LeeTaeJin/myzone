class CreateSidealerts < ActiveRecord::Migration
  def change
    create_table :sidealerts do |t|
      
      t.string :content
      t.string :color
      
      t.timestamps null: false
    end
  end
end
